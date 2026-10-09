import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/analytics/analytics.dart';
import '../../../core/error/api_exception.dart';
import '../../../shared/application/contracts.dart';
import '../domain/cart.dart';
import '../domain/cart_repository.dart';
import '../presentation/widgets/added_to_bag_sheet.dart';

class BagState extends Equatable {
  const BagState({this.cart, this.loading = false, this.stale = false, this.error, this.busyItems = const {}, this.pendingQuantities = const {}, this.promoBusy = false, this.promoError});

  final Cart? cart;
  final bool loading;

  /// Offline copy — mutations are disabled.
  final bool stale;
  final Object? error;

  /// Lines with a request in flight.
  final Set<String> busyItems;

  /// Quantity the customer stepped to, before the debounced PATCH lands.
  final Map<String, int> pendingQuantities;
  final bool promoBusy;
  final ApiException? promoError;

  int get count => cart?.itemsCount ?? 0;
  int quantityOf(CartItem item) => pendingQuantities[item.id] ?? item.quantity;

  BagState copyWith({
    Cart? cart,
    bool? loading,
    bool? stale,
    Object? Function()? error,
    Set<String>? busyItems,
    Map<String, int>? pendingQuantities,
    bool? promoBusy,
    ApiException? Function()? promoError,
  }) =>
      BagState(
        cart: cart ?? this.cart,
        loading: loading ?? this.loading,
        stale: stale ?? this.stale,
        error: error == null ? this.error : error(),
        busyItems: busyItems ?? this.busyItems,
        pendingQuantities: pendingQuantities ?? this.pendingQuantities,
        promoBusy: promoBusy ?? this.promoBusy,
        promoError: promoError == null ? this.promoError : promoError(),
      );

  @override
  List<Object?> get props => [cart, loading, stale, error, busyItems, pendingQuantities, promoBusy, promoError];
}

/// The bag for the whole app ([BagService]). Every mutation returns the server-priced cart; mutations are
/// serialized so responses can never arrive out of order, and quantity steps are debounced into one PATCH.
class BagCubit extends Cubit<BagState> implements BagService {
  BagCubit(this._repo, this._auth, this._analytics) : super(const BagState()) {
    _authSub = _auth.userChanges.listen((_) => refresh()); // the server merges the guest bag on sign-in
  }

  final CartRepository _repo;
  final AuthGate _auth;
  final Analytics _analytics;
  late final StreamSubscription<Object?> _authSub;
  Future<void> _queue = Future.value();
  final _debounces = <String, Timer>{};
  final _countController = StreamController<int>.broadcast();

  @override
  Stream<int> get count => _countController.stream;

  @override
  int get currentCount => state.count;

  @override
  void onChange(Change<BagState> change) {
    super.onChange(change);
    if (change.currentState.count != change.nextState.count) _countController.add(change.nextState.count);
  }

  /// Runs [task] after every earlier mutation finished.
  Future<T> _serial<T>(Future<T> Function() task) {
    final c = Completer<T>();
    _queue = _queue.then((_) => task().then(c.complete, onError: c.completeError)).catchError((Object _) {});
    return c.future;
  }

  @override
  Future<void> refresh() async {
    emit(state.copyWith(loading: state.cart == null, error: () => null));
    try {
      final r = await _serial(_repo.fetch);
      emit(state.copyWith(cart: r.data, stale: r.stale, loading: false));
    } catch (e) {
      emit(state.copyWith(loading: false, error: () => e));
    }
  }

  @override
  Future<void> addVariant(String variantId, {int quantity = 1}) async {
    final cart = await _serial(() => _repo.addVariant(variantId, quantity: quantity));
    final productId = cart.itemForVariant(variantId)?.productId;
    _analytics.addToCart(productId: productId);
    emit(state.copyWith(cart: cart, stale: false, error: () => null));
  }

  @override
  Future<void> addDesign(String designId, {int quantity = 1}) async {
    final cart = await _serial(() => _repo.addDesign(designId, quantity: quantity));
    _analytics.addToCart();
    emit(state.copyWith(cart: cart, stale: false, error: () => null));
  }

  @override
  Future<void> showAddedSheet(BuildContext context) => showAddedToBagSheet(context, this);

  /// Debounced quantity change: the stepper updates instantly, the server is asked once the customer stops.
  void setQuantity(CartItem item, int quantity) {
    if (state.stale || quantity < 1) return;
    emit(state.copyWith(pendingQuantities: {...state.pendingQuantities, item.id: quantity}));
    _debounces[item.id]?.cancel();
    _debounces[item.id] = Timer(const Duration(milliseconds: 400), () => _commitQuantity(item.id, quantity));
  }

  Future<void> _commitQuantity(String itemId, int quantity) async {
    await _mutate(itemId, () => _repo.updateQuantity(itemId, quantity));
    final pending = {...state.pendingQuantities}..remove(itemId);
    emit(state.copyWith(pendingQuantities: pending));
  }

  /// Removes a line; returns it so the UI can offer undo (re-adding through the same endpoint).
  Future<CartItem?> remove(CartItem item) async {
    final ok = await _mutate(item.id, () => _repo.remove(item.id));
    return ok ? item : null;
  }

  Future<void> undoRemove(CartItem item) async {
    try {
      if (item.designId != null) {
        await addDesign(item.designId!, quantity: item.quantity);
      } else if (item.variantId != null) {
        await addVariant(item.variantId!, quantity: item.quantity);
      }
    } on ApiException catch (e) {
      emit(state.copyWith(error: () => e));
    }
  }

  Future<bool> applyPromo(String code) async {
    if (code.trim().isEmpty) return false;
    emit(state.copyWith(promoBusy: true, promoError: () => null));
    try {
      final cart = await _serial(() => _repo.applyPromo(code));
      emit(state.copyWith(cart: cart, promoBusy: false));
      return cart.promo?.valid ?? true;
    } on ApiException catch (e) {
      emit(state.copyWith(promoBusy: false, promoError: () => e));
      return false;
    }
  }

  Future<void> removePromo() async {
    emit(state.copyWith(promoBusy: true, promoError: () => null));
    try {
      final cart = await _serial(_repo.removePromo);
      emit(state.copyWith(cart: cart, promoBusy: false));
    } on ApiException catch (e) {
      emit(state.copyWith(promoBusy: false, promoError: () => e));
    }
  }

  Future<void> setGift(bool isGift) async {
    try {
      final cart = await _serial(() => _repo.setGift(isGift));
      emit(state.copyWith(cart: cart));
    } on ApiException catch (e) {
      emit(state.copyWith(error: () => e));
    }
  }

  Future<bool> _mutate(String itemId, Future<Cart> Function() call) async {
    emit(state.copyWith(busyItems: {...state.busyItems, itemId}, error: () => null));
    try {
      final cart = await _serial(call);
      emit(state.copyWith(cart: cart, busyItems: {...state.busyItems}..remove(itemId)));
      return true;
    } on ApiException catch (e) {
      emit(state.copyWith(busyItems: {...state.busyItems}..remove(itemId), error: () => e));
      if (e.isConflict || e.isNotFound) unawaited(refresh());
      return false;
    }
  }

  @override
  Future<void> close() async {
    for (final t in _debounces.values) {
      t.cancel();
    }
    await _authSub.cancel();
    await _countController.close();
    return super.close();
  }
}
