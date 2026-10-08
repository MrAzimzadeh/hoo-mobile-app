import '../../../core/storage/cached.dart';
import 'home_content.dart';

abstract interface class HomeRepository {
  /// Loads every section in parallel. A section that fails stays empty; throws `ApiException` only when nothing
  /// could be loaded (and there is no offline copy). `stale` when any section came from the offline cache.
  Future<Cached<HomeContent>> load();
}
