import '../../../../core/error/api_exception.dart';
import '../../../../core/storage/cached.dart';
import '../../../../shared/domain/models.dart';
import '../../domain/address_draft.dart';
import '../../domain/profile_repositories.dart';
import 'list_section_cubit.dart';

class AddressesCubit extends ListSectionCubit<SavedAddress> {
  AddressesCubit(this._repo);

  final AddressRepository _repo;

  @override
  Future<Cached<List<SavedAddress>>> fetch() => _repo.list();

  Future<ApiException?> delete(SavedAddress address) async {
    final e = await mutate(address.id, () => _repo.delete(address.id));
    if (e == null || e.isNotFound) {
      // the server promotes another default when the default is deleted — re-read instead of guessing
      replaceItems(state.items.where((a) => a.id != address.id).toList());
      await load();
      return null;
    }
    return e;
  }

  Future<ApiException?> makeDefault(SavedAddress address) async {
    if (address.isDefault) return null;
    final e = await mutate(address.id, () => _repo.update(address.id, AddressDraft.fromSaved(address).copyWithDefault(true)));
    if (e == null) await load();
    return e;
  }
}
