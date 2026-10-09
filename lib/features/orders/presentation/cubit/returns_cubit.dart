import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/order_models.dart';
import '../../domain/orders_repositories.dart';
import 'orders_list_cubit.dart' show ListStatus;

class ReturnsState extends Equatable {
  const ReturnsState({this.status = ListStatus.loading, this.items = const [], this.error});

  final ListStatus status;
  final List<ReturnRecord> items;
  final Object? error;

  @override
  List<Object?> get props => [status, items, error];
}

/// `GET /account/returns` (not paged by the server).
class ReturnsCubit extends Cubit<ReturnsState> {
  ReturnsCubit(this._repo) : super(const ReturnsState());

  final OrdersRepository _repo;

  Future<void> load() async {
    if (state.items.isEmpty) emit(const ReturnsState());
    try {
      final items = await _repo.returns();
      if (!isClosed) emit(ReturnsState(status: ListStatus.ready, items: items));
    } catch (e) {
      if (isClosed) return;
      emit(state.items.isEmpty
          ? ReturnsState(status: ListStatus.failure, error: e)
          : ReturnsState(status: ListStatus.ready, items: state.items, error: e));
    }
  }
}
