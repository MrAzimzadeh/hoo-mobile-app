import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../domain/home_content.dart';
import '../../domain/home_repository.dart';

enum HomeStatus { loading, success, failure }

class HomeState extends Equatable {
  const HomeState({this.status = HomeStatus.loading, this.content = const HomeContent(), this.stale = false, this.error});

  final HomeStatus status;
  final HomeContent content;
  final bool stale;
  final Object? error;

  @override
  List<Object?> get props => [status, content, stale, error];
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repo) : super(const HomeState());

  final HomeRepository _repo;

  Future<void> load() async {
    if (state.status == HomeStatus.failure) emit(const HomeState());
    try {
      final r = await _repo.load();
      if (!isClosed) emit(HomeState(status: HomeStatus.success, content: r.data, stale: r.stale));
    } on ApiException catch (e) {
      if (isClosed) return;
      // keep what is on screen when a pull-to-refresh fails
      emit(
        state.content.isEmpty ? HomeState(status: HomeStatus.failure, error: e) : HomeState(status: HomeStatus.success, content: state.content, stale: true),
      );
    }
  }
}
