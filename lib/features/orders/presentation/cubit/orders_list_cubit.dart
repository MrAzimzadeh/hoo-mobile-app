import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/order_models.dart';
import '../../domain/orders_repositories.dart';

enum ListStatus { loading, ready, failure }

class OrdersListState extends Equatable {
  const OrdersListState({
    this.status = ListStatus.loading,
    this.items = const [],
    this.page = 0,
    this.hasMore = false,
    this.loadingMore = false,
    this.loadMoreError,
    this.error,
    this.stale = false,
  });

  final ListStatus status;
  final List<OrderListItem> items;
  final int page;
  final bool hasMore;
  final bool loadingMore;
  final Object? loadMoreError;
  final Object? error;
  final bool stale;

  bool get isEmpty => status == ListStatus.ready && items.isEmpty;

  OrdersListState copyWith({
    ListStatus? status,
    List<OrderListItem>? items,
    int? page,
    bool? hasMore,
    bool? loadingMore,
    Object? Function()? loadMoreError,
    Object? Function()? error,
    bool? stale,
  }) =>
      OrdersListState(
        status: status ?? this.status,
        items: items ?? this.items,
        page: page ?? this.page,
        hasMore: hasMore ?? this.hasMore,
        loadingMore: loadingMore ?? this.loadingMore,
        loadMoreError: loadMoreError == null ? this.loadMoreError : loadMoreError(),
        error: error == null ? this.error : error(),
        stale: stale ?? this.stale,
      );

  @override
  List<Object?> get props => [status, items, page, hasMore, loadingMore, loadMoreError, error, stale];
}

/// `GET /account/orders` with infinite scroll. Page 1 may come from the offline cache (stale → no paging).
class OrdersListCubit extends Cubit<OrdersListState> {
  OrdersListCubit(this._repo, {this.pageSize = 20}) : super(const OrdersListState());

  final OrdersRepository _repo;
  final int pageSize;
  int _generation = 0;

  Future<void> load() async {
    final gen = ++_generation;
    if (state.items.isEmpty) emit(state.copyWith(status: ListStatus.loading, error: () => null));
    try {
      final r = await _repo.orders(page: 1, pageSize: pageSize);
      if (isClosed || gen != _generation) return;
      emit(OrdersListState(
        status: ListStatus.ready,
        items: r.data.items,
        page: 1,
        hasMore: !r.stale && r.data.canLoadMore,
        stale: r.stale,
      ));
    } catch (e) {
      if (isClosed || gen != _generation) return;
      // keep what is on screen after a failed pull-to-refresh
      emit(state.items.isEmpty ? state.copyWith(status: ListStatus.failure, error: () => e) : state.copyWith(error: () => e));
    }
  }

  Future<void> refresh() => load();

  Future<void> loadMore() async {
    if (!state.hasMore || state.loadingMore || state.status != ListStatus.ready) return;
    final gen = _generation;
    emit(state.copyWith(loadingMore: true, loadMoreError: () => null));
    try {
      final r = await _repo.orders(page: state.page + 1, pageSize: pageSize);
      if (isClosed || gen != _generation) return;
      final known = state.items.map((o) => o.id).toSet();
      emit(state.copyWith(
        items: [...state.items, ...r.data.items.where((o) => !known.contains(o.id))],
        page: state.page + 1,
        hasMore: r.data.canLoadMore,
        loadingMore: false,
      ));
    } catch (e) {
      if (isClosed || gen != _generation) return;
      emit(state.copyWith(loadingMore: false, loadMoreError: () => e));
    }
  }
}
