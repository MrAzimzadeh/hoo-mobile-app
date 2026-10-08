import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../shared/application/contracts.dart';
import '../../../../shared/domain/models.dart';
import '../../data/wishlist_service_impl.dart';
import '../../domain/wishlist_models.dart';
import '../../domain/wishlist_repositories.dart';

enum ListStatus { loading, success, failure }

class WishlistState extends Equatable {
  const WishlistState({this.status = ListStatus.loading, this.items = const [], this.error});

  final ListStatus status;
  final List<ProductCard> items;
  final Object? error;

  @override
  List<Object?> get props => [status, items, error];
}

/// The signed-in customer's wishlist: list, remove (with undo), share, and "move to bag".
class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit(this._service, this._repo, this._variants, this._bag) : super(const WishlistState());

  final WishlistServiceImpl _service;
  final WishlistRepository _repo;
  final ProductVariantsRepository _variants;
  final BagService _bag;

  Future<void> load() async {
    if (state.status == ListStatus.failure) emit(const WishlistState());
    try {
      final items = await _service.load();
      if (!isClosed) emit(WishlistState(status: ListStatus.success, items: items));
    } on ApiException catch (e) {
      if (!isClosed) {
        emit(state.items.isEmpty ? WishlistState(status: ListStatus.failure, error: e) : WishlistState(status: ListStatus.success, items: state.items));
      }
    }
  }

  /// Removes at once from the list and the hearts; returns the removed card so the UI can offer undo.
  Future<ProductCard?> remove(ProductCard product) async {
    final index = state.items.indexWhere((p) => p.id == product.id);
    if (index < 0) return null;
    final before = state.items;
    emit(WishlistState(status: ListStatus.success, items: [...before]..removeAt(index)));
    try {
      await _service.setWishlisted(product.id, false);
      return product;
    } on ApiException {
      if (!isClosed) emit(WishlistState(status: ListStatus.success, items: before));
      return null;
    }
  }

  Future<void> undoRemove(ProductCard product) async {
    try {
      await _service.setWishlisted(product.id, true);
    } on ApiException {
      return;
    }
    if (!isClosed) await load();
  }

  /// `POST /wishlist/share` → the public URL.
  Future<WishlistShare> share() => _repo.share();

  Future<PickerProduct> picker(String slug) => _variants.bySlug(slug);

  Future<void> moveToBag(ProductCard product, String variantId) async {
    await _bag.addVariant(variantId);
  }
}

class SharedWishlistState extends Equatable {
  const SharedWishlistState({this.status = ListStatus.loading, this.list, this.error});

  final ListStatus status;
  final SharedWishlist? list;
  final Object? error;

  @override
  List<Object?> get props => [status, list, error];
}

class SharedWishlistCubit extends Cubit<SharedWishlistState> {
  SharedWishlistCubit(this._repo, this.token) : super(const SharedWishlistState());

  final WishlistRepository _repo;
  final String token;

  Future<void> load() async {
    emit(const SharedWishlistState());
    try {
      final list = await _repo.shared(token);
      if (!isClosed) emit(SharedWishlistState(status: ListStatus.success, list: list));
    } on ApiException catch (e) {
      if (!isClosed) emit(SharedWishlistState(status: ListStatus.failure, error: e));
    }
  }
}

class AlertsState extends Equatable {
  const AlertsState({this.status = ListStatus.loading, this.items = const [], this.error});

  final ListStatus status;
  final List<StockAlert> items;
  final Object? error;

  @override
  List<Object?> get props => [status, items, error];
}

class AlertsCubit extends Cubit<AlertsState> {
  AlertsCubit(this._repo) : super(const AlertsState());

  final AlertsRepository _repo;

  Future<void> load() async {
    if (state.status == ListStatus.failure) emit(const AlertsState());
    try {
      final items = await _repo.list();
      if (!isClosed) emit(AlertsState(status: ListStatus.success, items: items));
    } on ApiException catch (e) {
      if (!isClosed) {
        emit(state.items.isEmpty ? AlertsState(status: ListStatus.failure, error: e) : AlertsState(status: ListStatus.success, items: state.items));
      }
    }
  }

  /// Optimistic delete; `customers.alert_not_found` counts as done. Returns the failure otherwise.
  Future<ApiException?> delete(StockAlert alert) async {
    final before = state.items;
    emit(AlertsState(status: ListStatus.success, items: before.where((a) => a.id != alert.id).toList()));
    try {
      await _repo.delete(alert.id);
      return null;
    } on ApiException catch (e) {
      if (e.isNotFound) return null;
      if (!isClosed) emit(AlertsState(status: ListStatus.success, items: before));
      return e;
    }
  }
}
