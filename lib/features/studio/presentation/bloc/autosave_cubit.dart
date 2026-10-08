import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../shared/design_system/design_system.dart';
import '../../data/design_save_queue.dart';
import '../../domain/layer_math.dart';
import '../../domain/models/design.dart';
import '../../domain/studio_repositories.dart';

enum SaveStatus { idle, saving, saved, offline, failed }

class AutosaveState extends Equatable {
  const AutosaveState({this.status = SaveStatus.idle, this.designId, this.error});

  final SaveStatus status;
  final String? designId;
  final ApiException? error;

  @override
  List<Object?> get props => [status, designId, error];
}

/// Saves the design while it is being edited: the first meaningful change creates it (`POST`), later changes
/// `PATCH` it (debounced). Offline, the latest payload is queued in the local database and sent when the
/// connection returns — the customer keeps designing and sees "Saved offline".
class AutosaveCubit extends Cubit<AutosaveState> {
  AutosaveCubit(this._repo, this._queue, {Stream<bool>? online, String? designId, Duration debounce = HooDurations.autosaveDebounce})
    : _debounce = debounce,
      super(AutosaveState(designId: designId)) {
    _onlineSub = online?.where((o) => o).listen((_) => unawaited(retry()));
  }

  final StudioDesignRepository _repo;
  final DesignSaveQueue _queue;
  final Duration _debounce;
  StreamSubscription<bool>? _onlineSub;
  Timer? _timer;
  DesignDoc? _pending;
  List<String> _fonts = const [];
  bool _imageRights = false;
  Future<void>? _inFlight;

  /// Call on every document change. [meaningful] gates the first `POST` (an empty design is not worth saving).
  void changed(DesignDoc doc, {required List<String> fonts, bool imageRights = false, bool meaningful = true}) {
    if (state.designId == null && !meaningful) return;
    _pending = doc;
    _fonts = fonts;
    _imageRights = imageRights;
    _timer?.cancel();
    _timer = Timer(state.designId == null ? Duration.zero : _debounce, () => unawaited(_flush()));
  }

  /// Saves right now and completes when the server has the latest document (or the save failed). Returns the id.
  Future<String?> flush() async {
    _timer?.cancel();
    await _flush();
    return state.designId;
  }

  Future<void> retry() async {
    if (_pending == null) {
      await _drainQueue();
      return;
    }
    await _flush();
  }

  Future<void> _flush() async {
    // serialize: one request at a time, always sending the newest document
    while (_inFlight != null) {
      await _inFlight;
    }
    final doc = _pending;
    if (doc == null) return;
    final completer = Completer<void>();
    _inFlight = completer.future;
    try {
      await _save(doc);
    } finally {
      _inFlight = null;
      completer.complete();
    }
    if (_pending != null && !identical(_pending, doc) && !isClosed) await _flush();
  }

  Future<void> _save(DesignDoc doc) async {
    if (isClosed) return;
    emit(AutosaveState(status: SaveStatus.saving, designId: state.designId));
    final layers = LayerMath.toApiLayers(doc.layers, _fonts);
    try {
      var id = state.designId;
      if (id == null) {
        final created = await _repo.create(name: doc.name.isEmpty ? null : doc.name, spec: doc.spec, layers: layers);
        id = created.id;
        if (isClosed) return;
        emit(AutosaveState(status: SaveStatus.saving, designId: id));
        if (!identical(_pending, doc)) return; // newer edits arrived meanwhile: the loop sends them as a PATCH
      } else {
        await _repo.patch(id, StudioPayloads.update(name: doc.name, spec: doc.spec, layers: layers, confirmImageRights: _imageRights ? true : null));
      }
      await _queue.remove(id);
      if (identical(_pending, doc)) _pending = null;
      if (!isClosed) emit(AutosaveState(status: SaveStatus.saved, designId: id));
    } on ApiException catch (e) {
      final id = state.designId;
      if (e.isNetwork && id != null) {
        await _queue.enqueue(id, StudioPayloads.update(name: doc.name, spec: doc.spec, layers: layers));
        if (!isClosed) emit(AutosaveState(status: SaveStatus.offline, designId: id));
      } else if (e.isNetwork) {
        // not created yet: keep the document in memory and retry when back online
        if (!isClosed) emit(const AutosaveState(status: SaveStatus.offline));
      } else if (!isClosed) {
        emit(AutosaveState(status: SaveStatus.failed, designId: state.designId, error: e));
      }
    }
  }

  Future<void> _drainQueue() async {
    for (final q in await _queue.pending()) {
      try {
        await _repo.patch(q.designId, q.payload);
        await _queue.remove(q.designId);
        if (!isClosed && q.designId == state.designId) emit(AutosaveState(status: SaveStatus.saved, designId: q.designId));
      } on ApiException catch (e) {
        if (e.isNetwork) return;
        await _queue.markFailedAttempt(q.designId);
        if (q.attempts >= 5 || e.isNotFound) await _queue.remove(q.designId);
      }
    }
  }

  @override
  Future<void> close() async {
    _timer?.cancel();
    await _onlineSub?.cancel();
    return super.close();
  }
}
