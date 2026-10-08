import '../../../../core/error/api_exception.dart';
import '../../../../core/storage/cached.dart';
import '../../../../shared/domain/models.dart';
import '../../domain/profile_repositories.dart';
import 'list_section_cubit.dart';

class SavedCardsCubit extends ListSectionCubit<SavedCard> {
  SavedCardsCubit(this._repo);

  final SavedCardRepository _repo;

  @override
  Future<Cached<List<SavedCard>>> fetch() async => Cached(await _repo.list());

  Future<ApiException?> delete(SavedCard card) async {
    final e = await mutate(card.id, () => _repo.delete(card.id));
    if (e == null || e.isNotFound) {
      replaceItems(state.items.where((c) => c.id != card.id).toList());
      return null;
    }
    return e;
  }
}
