import '../../../../core/error/api_exception.dart';
import '../../../../core/storage/cached.dart';
import '../../domain/profile_models.dart';
import '../../domain/profile_repositories.dart';
import 'list_section_cubit.dart';

class ActiveDevicesCubit extends ListSectionCubit<ActiveSession> {
  ActiveDevicesCubit(this._repo);

  final SessionRepository _repo;

  @override
  Future<Cached<List<ActiveSession>>> fetch() async => Cached(await _repo.list());

  /// Signs another device out. The current device is signed out through `AuthGate.signOut` instead.
  Future<ApiException?> revoke(ActiveSession session) async {
    if (session.isCurrent) return null;
    final e = await mutate(session.id, () => _repo.revoke(session.id));
    if (e == null || e.isNotFound) {
      replaceItems(state.items.where((s) => s.id != session.id).toList());
      return null;
    }
    return e;
  }

  /// Signs out every other device; stops at the first failure and reports it.
  Future<ApiException?> revokeOthers() async {
    for (final s in state.items.where((s) => !s.isCurrent).toList()) {
      final e = await revoke(s);
      if (e != null) return e;
    }
    return null;
  }
}
