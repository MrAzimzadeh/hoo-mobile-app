import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../shared/domain/enums.dart';
import '../../domain/models/order_models.dart';
import '../../domain/models/return_models.dart';
import '../../domain/repositories.dart';

part 'orders_list_cubit.freezed.dart';

enum ListStatus { loading, ready, failure }

/// Status chips on the orders list.
// TODO(backend): `GET /account/orders` has no status filter, so chips filter the pages loaded so far.
enum OrderFilter {
  all,
  active,
  delivered,
  closed;

  bool matches(OrderStatus s) => switch (this) {
    OrderFilter.all => true,
    OrderFilter.active => s.isActive,
    OrderFilter.delivered => s == OrderStatus.delivered,
    OrderFilter.closed => const {OrderStatus.cancelled, OrderStatus.returned, OrderStatus.refunded}.contains(s),
  };
}

@freezed
abstract class OrdersListState with _$OrdersListState {
  const OrdersListState._();

  const factory OrdersListState({
    @Default(ListStatus.loading) ListStatus status,
    @Default(<OrderListItem>[]) List<OrderListItem> items,
    @Default(1) int page,
    @Default(false) bool canLoadMore,
    @Default(false) bool loadingMore,
    @Default(false) bool stale,
    @Default(OrderFilter.all) OrderFilter filter,
    Object? error,
    Object? loadMoreError,
  }) = _OrdersListState;

  List<OrderListItem> get visible => items.where((o) => filter.matches(o.status)).toList();
}

/// `GET /account/orders`: first page (cached offline), infinite scroll, status chips.
class OrdersListCubit extends Cubit<OrdersListState> {
  OrdersListCubit(this._orders) : super(const OrdersListState());

  final OrdersRepository _orders;

  Future<void> load() async {
    if (state.items.isEmpty) emit(state.copyWith(status: ListStatus.loading, error: null));
    try {
      final r = await _orders.myOrders();
      if (isClosed) return;
      emit(
        state.copyWith(
          status: ListStatus.ready,
          items: r.data.items,
          page: r.data.page,
          canLoadMore: !r.stale && r.data.canLoadMore,
          stale: r.stale,
          error: null,
          loadMoreError: null,
        ),
      );
    } on ApiException catch (e) {
      if (isClosed) return;
      emit(state.items.isEmpty ? state.copyWith(status: ListStatus.failure, error: e) : state.copyWith(loadMoreError: e));
    }
  }

  Future<void> refresh() => load();

  Future<void> loadMore() async {
    if (!state.canLoadMore || state.loadingMore || state.status != ListStatus.ready) return;
    emit(state.copyWith(loadingMore: true, loadMoreError: null));
    try {
      final r = await _orders.myOrders(page: state.page + 1);
      if (isClosed) return;
      final known = state.items.map((o) => o.id).toSet();
      emit(
        state.copyWith(
          items: [...state.items, ...r.data.items.where((o) => !known.contains(o.id))],
          page: r.data.page,
          canLoadMore: r.data.canLoadMore,
          loadingMore: false,
        ),
      );
    } on ApiException catch (e) {
      if (isClosed) return;
      emit(state.copyWith(loadingMore: false, loadMoreError: e));
    }
  }

  void setFilter(OrderFilter f) {
    if (f == state.filter) return;
    emit(state.copyWith(filter: f));
    // A narrow chip may show few rows: fetch more so the user isn't left with an apparently short list.
    if (state.visible.length < 5) loadMore();
  }
}

@freezed
abstract class ReturnsListState with _$ReturnsListState {
  const factory ReturnsListState({
    @Default(ListStatus.loading) ListStatus status,
    @Default(<ReturnInfo>[]) List<ReturnInfo> items,
    @Default(false) bool stale,
    Object? error,
    Object? refreshError,
  }) = _ReturnsListState;
}

/// `GET /account/returns` (cached offline).
class ReturnsListCubit extends Cubit<ReturnsListState> {
  ReturnsListCubit(this._returns) : super(const ReturnsListState());

  final ReturnsRepository _returns;

  Future<void> load() async {
    if (state.items.isEmpty) emit(state.copyWith(status: ListStatus.loading, error: null));
    try {
      final r = await _returns.myReturns();
      if (isClosed) return;
      final sorted = [...r.data]..sort((a, b) => b.createdAt.compareTo(a.createdAt));
      emit(ReturnsListState(status: ListStatus.ready, items: sorted, stale: r.stale));
    } on ApiException catch (e) {
      if (isClosed) return;
      emit(state.items.isEmpty ? state.copyWith(status: ListStatus.failure, error: e) : state.copyWith(refreshError: e));
    }
  }
}
