import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../shared/application/contracts.dart';
import '../../domain/order_models.dart';
import '../../domain/order_view.dart';
import '../../domain/orders_repositories.dart';

/// Lets an action section (pay again, change slot) ask the screen to re-read the order after a conflict.
abstract interface class OrderRefresher {
  Future<void> refresh();
}

enum OrderDetailStatus { loading, ready, failure, needsSignIn }

class OrderDetailState extends Equatable {
  const OrderDetailState({this.status = OrderDetailStatus.loading, this.view, this.error, this.refreshing = false, this.refreshError});

  final OrderDetailStatus status;
  final OrderView? view;
  final Object? error;
  final bool refreshing;

  /// A background refresh failed while an older copy stays on screen.
  final Object? refreshError;

  OrderDetail? get order => view?.order;

  @override
  List<Object?> get props => [status, view, error, refreshing, refreshError];
}

/// Order detail screen: the signed-in account endpoint, or public tracking when a phone is given.
class OrderDetailCubit extends Cubit<OrderDetailState> implements OrderRefresher {
  OrderDetailCubit(this._repo, this._auth, this.access) : super(const OrderDetailState()) {
    _userSub = _auth.userChanges.listen((user) {
      // signed in from the "Sign in to view" state → load the order
      if (user != null && state.status == OrderDetailStatus.needsSignIn) unawaited(load());
    });
  }

  final OrderDetailRepository _repo;
  final AuthGate _auth;
  final OrderAccess access;
  StreamSubscription<Object?>? _userSub;
  int _generation = 0;

  bool get isTracking => access is TrackingOrderAccess;

  Future<void> load() async {
    if (access is AccountOrderAccess && !_auth.isSignedIn) {
      emit(const OrderDetailState(status: OrderDetailStatus.needsSignIn));
      return;
    }
    final gen = ++_generation;
    final access_ = access;
    final instant = access_ is TrackingOrderAccess ? _repo.recentTracking(access_.number, access_.phone) : null;
    if (instant != null) {
      emit(OrderDetailState(status: OrderDetailStatus.ready, view: instant, refreshing: true));
    } else if (state.view == null) {
      emit(const OrderDetailState());
    }
    await _fetch(gen);
  }

  @override
  Future<void> refresh() async {
    if (state.view == null) return load();
    final gen = ++_generation;
    emit(OrderDetailState(status: OrderDetailStatus.ready, view: state.view, refreshing: true));
    await _fetch(gen);
  }

  /// A mutation answered with the updated order (slot change) — show it without another round trip.
  void applyOrder(OrderDetail order) {
    final view = state.view;
    if (view == null) return;
    _generation++;
    emit(OrderDetailState(status: OrderDetailStatus.ready, view: view.copyWith(order: order)));
  }

  Future<void> _fetch(int gen) async {
    try {
      final view = await _repo.load(access);
      if (isClosed || gen != _generation) return;
      emit(OrderDetailState(status: OrderDetailStatus.ready, view: view));
    } catch (e) {
      if (isClosed || gen != _generation) return;
      if (e is ApiException && e.isUnauthorized && access is AccountOrderAccess) {
        emit(const OrderDetailState(status: OrderDetailStatus.needsSignIn));
      } else if (state.view != null) {
        emit(OrderDetailState(status: OrderDetailStatus.ready, view: state.view, refreshError: e));
      } else {
        emit(OrderDetailState(status: OrderDetailStatus.failure, error: e));
      }
    }
  }

  @override
  Future<void> close() async {
    await _userSub?.cancel();
    return super.close();
  }
}
