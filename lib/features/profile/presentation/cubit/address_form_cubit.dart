import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../shared/domain/models.dart';
import '../../domain/address_draft.dart';
import '../../domain/profile_repositories.dart';

class AddressFormState extends Equatable {
  const AddressFormState({required this.draft, this.showErrors = false, this.saving = false, this.serverErrors = const {}, this.error, this.saved});

  final AddressDraft draft;

  /// Client errors are shown once the user tried to submit (not while they type the first time).
  final bool showErrors;
  final bool saving;

  /// Localized server messages per field (`address.city` → city).
  final Map<AddressField, String> serverErrors;

  /// Non-field failure (shown as an alert).
  final ApiException? error;

  /// Set once saved — the page pops with it.
  final SavedAddress? saved;

  Map<AddressField, AddressFieldError> get clientErrors => showErrors ? draft.validate() : const {};

  AddressFormState copyWith({
    AddressDraft? draft,
    bool? showErrors,
    bool? saving,
    Map<AddressField, String>? serverErrors,
    ApiException? error,
    bool clearError = false,
    SavedAddress? saved,
  }) => AddressFormState(
    draft: draft ?? this.draft,
    showErrors: showErrors ?? this.showErrors,
    saving: saving ?? this.saving,
    serverErrors: serverErrors ?? this.serverErrors,
    error: clearError ? null : (error ?? this.error),
    saved: saved ?? this.saved,
  );

  @override
  List<Object?> get props => [draft, showErrors, saving, serverErrors, error, saved];
}

/// Create or edit one address (`POST` / `PUT /account/addresses`).
class AddressFormCubit extends Cubit<AddressFormState> {
  AddressFormCubit(this._repo, {SavedAddress? initial})
    : _id = initial?.id,
      super(AddressFormState(draft: initial == null ? const AddressDraft() : AddressDraft.fromSaved(initial)));

  final AddressRepository _repo;
  final String? _id;

  bool get isEditing => _id != null;

  void setField(AddressField field, String value) {
    final server = Map<AddressField, String>.of(state.serverErrors)..remove(field);
    emit(state.copyWith(draft: state.draft.copyWithField(field, value), serverErrors: server, clearError: true));
  }

  void setDefault(bool value) => emit(state.copyWith(draft: state.draft.copyWithDefault(value)));

  Future<void> submit() async {
    if (state.saving) return;
    if (!state.draft.isValid) {
      emit(state.copyWith(showErrors: true));
      return;
    }
    emit(state.copyWith(showErrors: true, saving: true, serverErrors: const {}, clearError: true));
    try {
      final id = _id;
      final saved = id == null ? await _repo.create(state.draft) : await _repo.update(id, state.draft);
      if (!isClosed) emit(state.copyWith(saving: false, saved: saved));
    } on ApiException catch (e) {
      if (isClosed) return;
      final fields = <AddressField, String>{};
      for (final f in AddressField.values) {
        final wire = _wireField(f);
        final msg = wire == null ? null : e.fieldError(wire);
        if (msg != null) fields[f] = msg;
      }
      emit(state.copyWith(saving: false, serverErrors: fields, error: fields.isEmpty ? e : null));
    }
  }

  /// Request field names (`label`, `address.city`, … — `fieldError` matches the `.city` suffix). Building has no
  /// field of its own on the server (it is part of street).
  static String? _wireField(AddressField f) => switch (f) {
    AddressField.label => 'label',
    AddressField.city => 'city',
    AddressField.district => 'district',
    AddressField.street => 'street',
    AddressField.building => null,
    AddressField.apartment => 'apartment',
    AddressField.note => 'courierNote',
  };
}
