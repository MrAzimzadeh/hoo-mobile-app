import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../shared/design_system/tokens/hoo_tokens.dart';
import '../../data/bag_store.dart';
import '../../domain/cart_models.dart';

enum BagStatus { loading, ready, failure }

class BagState extends Equatable {
  const BagState({
    this.status = BagStatus.loading,
    this.cart,
    this.stale = false,
    this.error,
    this.pendingQuantities = const {},
    this.lineErrors = const {},
    this.removing = const {},
    this.promoBusy = false,
    this.promoError,
    this.giftBusy = false,
  });

  final BagStatus status;
  final Cart? cart;

  /// Offline copy — every mutation is disabled.
  final bool stale;
  final Object? error;

  /// Optimistic quantities while a debounced `PATCH` is pending (item id → quantity).
  final Map<String, int> pendingQuantities;

  /// Failed line mutations (item id → error), shown inline under the line.
  final Map<String, Object> lineErrors;
  final Set<String> removing;
  final bool promoBusy;
  final Object? promoError;
  final bool giftBusy;

  bool get isEmpty => status == BagStatus.ready && (cart?.isEmpty ?? true);

  /// The server is recalculating (a line update is pending or in flight).
  bool get updating => pendingQuantities.isNotEmpty || removing.isNotEmpty || promoBusy || giftBusy;

  bool get canCheckout => !stale && !updating && (cart?.canCheckout ?? false);

  int quantityOf(CartItem item) => pendingQuantities[item.id] ?? item.quantity;

  BagState copyWith({
    BagStatus? status,
    Cart? cart,
    bool? stale,
    Object? error,
    bool clearError = false,
    Map<String, int>? pendingQuantities,
    Map<String, Object>? lineErrors,
    Set<String>? removing,
    bool? promoBusy,
    Object? promoError,
    bool clearPromoError = false,
    bool? giftBusy,
  }) => BagState(
    status: status ?? this.status,
    cart: cart ?? this.cart,
    stale: stale ?? this.stale,
    error: clearError ? null : (error ?? this.error),
    pendingQuantities: pendingQuantities ?? this.pendingQuantities,
    lineErrors: lineErrors ?? this.lineErrors,
    removing: removing ?? this.removing,
    promoBusy: promoBusy ?? this.promoBusy,
    promoError: clearPromoError ? null : (promoError ?? this.promoError),
    giftBusy: giftBusy ?? this.giftBusy,
  );

  @override
  List<Object?> get props => [status, cart, stale, error, pendingQuantities, lineErrors, removing, promoBusy, promoError, giftBusy];
}

/// One-off UI effects (toasts, undo).
sealed class BagEffect {
  const BagEffect();
}

class BagItemRemoved extends BagEffect {
  const BagItemRemoved(this.item);
  final CartItem item;
}

class BagFailure extends BagEffect {
  const BagFailure(this.error);
  final Object error;
}

class BagPromoApplied extends BagEffect {
  const BagPromoApplied(this.code);
  final String code;
}

/// Bag screen state on top of the shared [BagStore]: optimistic quantity steps (debounced, latest wins),
/// swipe-to-remove with undo, promo and gift.
class BagCubit extends Cubit<BagState> {
  BagCubit(this._store, {Duration quantityDebounce = HooDurations.priceDebounce})
    : _debounce = quantityDebounce,
      super(_fromSnapshot(const BagState(), _store.snapshot)) {
    _sub = _store.snapshots.listen((s) => emit(_fromSnapshot(state, s)));
  }

  final BagStore _store;
  final Duration _debounce;
  late final StreamSubscription<BagSnapshot> _sub;
  final _timers = <String, Timer>{};
  final _effects = StreamController<BagEffect>.broadcast();

  Stream<BagEffect> get effects => _effects.stream;

  static BagState _fromSnapshot(BagState prev, BagSnapshot s) {
    if (s.cart != null) {
      // drop line errors for lines that no longer exist
      final ids = s.cart!.items.map((i) => i.id).toSet();
      return prev.copyWith(
        status: BagStatus.ready,
        cart: s.cart,
        stale: s.stale,
        clearError: true,
        lineErrors: {
          for (final e in prev.lineErrors.entries)
            if (ids.contains(e.key)) e.key: e.value,
        },
      );
    }
    if (s.error != null) return prev.copyWith(status: BagStatus.failure, error: s.error);
    return prev.copyWith(status: BagStatus.loading);
  }

  /// Initial load (the store may already have a bag from the badge) and pull-to-refresh.
  Future<void> load() => _store.refresh();

  Future<void> refresh() => _store.refresh();

  void changeQuantity(CartItem item, int quantity) {
    if (state.stale || quantity < 1 || quantity > item.maxQuantity) return;
    final errors = Map.of(state.lineErrors)..remove(item.id);
    final pending = Map.of(state.pendingQuantities);
    if (quantity == item.quantity) {
      pending.remove(item.id);
      _timers.remove(item.id)?.cancel();
      emit(state.copyWith(pendingQuantities: pending, lineErrors: errors));
      return;
    }
    pending[item.id] = quantity;
    emit(state.copyWith(pendingQuantities: pending, lineErrors: errors));
    _timers.remove(item.id)?.cancel();
    _timers[item.id] = Timer(_debounce, () => _commitQuantity(item.id));
  }

  Future<void> _commitQuantity(String itemId) async {
    _timers.remove(itemId);
    final quantity = state.pendingQuantities[itemId];
    if (quantity == null) return;
    try {
      await _store.updateQuantity(itemId, quantity);
      if (isClosed) return;
      // a newer step may have been queued meanwhile — keep it
      if (state.pendingQuantities[itemId] == quantity && !_timers.containsKey(itemId)) {
        emit(state.copyWith(pendingQuantities: Map.of(state.pendingQuantities)..remove(itemId)));
      }
    } on ApiException catch (e) {
      if (isClosed) return;
      emit(state.copyWith(pendingQuantities: Map.of(state.pendingQuantities)..remove(itemId), lineErrors: {...state.lineErrors, itemId: e}));
    }
  }

  Future<void> remove(CartItem item) async {
    if (state.stale || state.removing.contains(item.id)) return;
    _timers.remove(item.id)?.cancel();
    emit(state.copyWith(removing: {...state.removing, item.id}, pendingQuantities: Map.of(state.pendingQuantities)..remove(item.id)));
    try {
      await _store.remove(item.id);
      _effects.add(BagItemRemoved(item));
    } on ApiException catch (e) {
      _effects.add(BagFailure(e));
    } finally {
      if (!isClosed) emit(state.copyWith(removing: {...state.removing}..remove(item.id)));
    }
  }

  Future<void> undoRemove(CartItem item) async {
    if (item.variantId == null && item.designId == null) return;
    try {
      await _store.restore(item);
    } on ApiException catch (e) {
      _effects.add(BagFailure(e));
    }
  }

  /// Applies a promo code. Returns `true` when the server accepted it.
  Future<bool> applyPromo(String code) async {
    final trimmed = code.trim();
    if (trimmed.isEmpty || state.stale || state.promoBusy) return false;
    emit(state.copyWith(promoBusy: true, clearPromoError: true));
    try {
      final cart = await _store.applyPromo(trimmed);
      if (isClosed) return false;
      final promo = cart.promo;
      final ok = promo != null && promo.valid;
      emit(state.copyWith(promoBusy: false));
      if (ok) _effects.add(BagPromoApplied(promo.code));
      return ok;
    } on ApiException catch (e) {
      if (!isClosed) emit(state.copyWith(promoBusy: false, promoError: e));
      return false;
    }
  }

  Future<void> removePromo() async {
    if (state.stale || state.promoBusy) return;
    emit(state.copyWith(promoBusy: true, clearPromoError: true));
    try {
      await _store.removePromo();
    } on ApiException catch (e) {
      _effects.add(BagFailure(e));
    } finally {
      if (!isClosed) emit(state.copyWith(promoBusy: false));
    }
  }

  void clearPromoError() {
    if (state.promoError != null) emit(state.copyWith(clearPromoError: true));
  }

  Future<void> setGift(bool isGift) async {
    if (state.stale || state.giftBusy) return;
    emit(state.copyWith(giftBusy: true));
    try {
      await _store.setGift(isGift);
    } on ApiException catch (e) {
      _effects.add(BagFailure(e));
    } finally {
      if (!isClosed) emit(state.copyWith(giftBusy: false));
    }
  }

  @override
  Future<void> close() async {
    // flush pending steps so a quick tab switch doesn't lose them
    for (final id in _timers.keys.toList()) {
      _timers.remove(id)?.cancel();
      final q = state.pendingQuantities[id];
      if (q != null) unawaited(_store.updateQuantity(id, q).then<void>((_) {}, onError: (Object _) {}));
    }
    await _sub.cancel();
    await _effects.close();
    return super.close();
  }
}
