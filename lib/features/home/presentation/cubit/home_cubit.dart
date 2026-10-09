import 'dart:async';

import '../../../../shared/application/contracts.dart';
import '../../../../shared/application/load_cubit.dart';
import '../../data/home_repository.dart';
import '../../domain/home_models.dart';

/// Home feed; refreshes the "recently viewed" rail when the account changes.
class HomeCubit extends LoadCubit<HomeFeed> {
  HomeCubit(HomeRepository repo, AuthGate auth) : _repo = repo, super(() async => (await repo.feed()).data) {
    _sub = auth.userChanges.listen((_) => load());
  }

  final HomeRepository _repo;
  late final StreamSubscription<Object?> _sub;

  @override
  Future<void> load() async {
    emit(LoadState(data: state.data, loading: true, stale: state.stale));
    try {
      final r = await _repo.feed();
      emit(LoadState(data: r.data, loading: false, stale: r.stale));
    } catch (e) {
      emit(LoadState(data: state.data, loading: false, error: e, stale: state.stale));
    }
  }

  @override
  Future<void> close() async {
    await _sub.cancel();
    return super.close();
  }
}
