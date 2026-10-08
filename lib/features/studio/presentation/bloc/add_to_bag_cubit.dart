import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../shared/application/contracts.dart';
import '../../domain/models/design.dart';
import '../../domain/studio_repositories.dart';

enum AddToBagPhase { idle, saving, mockups, adding, done, failed }

class AddToBagState extends Equatable {
  const AddToBagState({this.phase = AddToBagPhase.idle, this.error});

  final AddToBagPhase phase;
  final ApiException? error;

  bool get busy => phase == AddToBagPhase.saving || phase == AddToBagPhase.mockups || phase == AddToBagPhase.adding;

  @override
  List<Object?> get props => [phase, error];
}

/// "Add to bag" for a custom design: make sure the server has the latest document (and the image-rights
/// confirmation), upload the front/back mockups taken from the 3D view, then `POST /cart/items { designId }`.
class AddToBagCubit extends Cubit<AddToBagState> {
  AddToBagCubit(this._designs, this._bag) : super(const AddToBagState());

  final StudioDesignRepository _designs;
  final BagService _bag;

  /// [saveNow] completes with the design id once the latest document is saved (null when it could not be).
  Future<bool> run({
    required Future<String?> Function() saveNow,
    required Future<Map<String, Uint8List>> Function() snapshot,
    required bool confirmImageRights,
    required int quantity,
  }) async {
    if (state.busy) return false;
    emit(const AddToBagState(phase: AddToBagPhase.saving));
    try {
      final id = await saveNow();
      if (id == null) {
        emit(const AddToBagState(phase: AddToBagPhase.failed));
        return false;
      }
      await _designs.patch(id, StudioPayloads.update(confirmImageRights: confirmImageRights));
      emit(const AddToBagState(phase: AddToBagPhase.mockups));
      final shots = await snapshot();
      for (final e in shots.entries) {
        await _designs.uploadMockup(id, e.value, filename: '${e.key}.png');
      }
      emit(const AddToBagState(phase: AddToBagPhase.adding));
      await _bag.addDesign(id, quantity: quantity);
      emit(const AddToBagState(phase: AddToBagPhase.done));
      return true;
    } on ApiException catch (e) {
      emit(AddToBagState(phase: AddToBagPhase.failed, error: e));
      return false;
    }
  }

  void reset() => emit(const AddToBagState());
}
