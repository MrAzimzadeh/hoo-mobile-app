import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/connectivity/connectivity_cubit.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../core/storage/app_database.dart';
import '../../../../shared/design_system/tokens/hoo_tokens.dart';
import '../../data/studio_repository.dart';
import '../../domain/models/design.dart';
import '../../domain/models/studio_config.dart';
import '../../domain/spec_rules.dart';

// ---------------------------------------------------------------- pricing

class PricingState extends Equatable {
  const PricingState({this.quote, this.updating = false, this.error});

  /// Last good server quote (kept while a new one is computed).
  final StudioQuote? quote;
  final bool updating;
  final ApiException? error;

  @override
  List<Object?> get props => [quote, updating, error];
}

/// Live price: every design change → debounced `POST /studio/price`; stale requests are cancelled. Never computed
/// locally. Reloads the config when the pricing version was superseded.
class PricingCubit extends Cubit<PricingState> {
  PricingCubit(this._repo, {this.onPricingOutdated}) : super(const PricingState());

  final StudioRepository _repo;
  final void Function()? onPricingOutdated;
  Timer? _debounce;
  CancelToken? _token;
  DesignDoc? _last;

  void update(DesignDoc doc, StudioConfig config) {
    if (doc == _last) return;
    _last = doc;
    if (!specHasSize(doc.spec) || doc.spec.colorId.isEmpty) return;
    _debounce?.cancel();
    emit(PricingState(quote: state.quote, updating: true));
    _debounce = Timer(HooDurations.priceDebounce, () => _fetch(doc, config));
  }

  Future<void> _fetch(DesignDoc doc, StudioConfig config) async {
    _token?.cancel();
    final token = _token = CancelToken();
    try {
      final q = await _repo.quote(doc.spec, doc.layers, pricingVersionId: config.pricingVersionId, fonts: config.fonts, cancelToken: token);
      if (!isClosed && !token.isCancelled) emit(PricingState(quote: q));
    } on ApiException catch (e) {
      if (e.isCancelled || isClosed) return;
      emit(PricingState(quote: state.quote, error: e));
      if (e.code == 'studio.pricing_version_not_found') onPricingOutdated?.call();
    }
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    _token?.cancel();
    return super.close();
  }
}

// ---------------------------------------------------------------- autosave

enum SaveStatus { idle, saving, saved, offline, error }

class AutosaveState extends Equatable {
  const AutosaveState({this.designId, this.status = SaveStatus.idle});

  final String? designId;
  final SaveStatus status;

  @override
  List<Object?> get props => [designId, status];
}

/// Creates the design on the first meaningful change, then debounced PATCHes. Offline (or on network errors) the
/// latest payload is queued in Drift and flushed when the device is back online.
class AutosaveCubit extends Cubit<AutosaveState> {
  AutosaveCubit(this._repo, this._db, ConnectivityCubit connectivity, {String? designId}) : super(AutosaveState(designId: designId)) {
    _online = connectivity.stream.listen((online) {
      if (online) unawaited(flushQueue());
    });
  }

  final StudioRepository _repo;
  final AppDatabase _db;
  late final StreamSubscription<bool> _online;
  Timer? _debounce;
  Future<void>? _creating;
  DesignDoc? _saved;
  DesignDoc? _pending;
  List<String> _fonts = const [];

  /// [meaningful]: at least one layer, or the customer reached the review.
  void changed(DesignDoc doc, StudioConfig config, {required bool meaningful, required bool editable}) {
    _fonts = config.fonts;
    if (!editable || doc == _saved) return;
    _pending = doc;
    if (state.designId == null && !meaningful) return;
    _debounce?.cancel();
    _debounce = Timer(HooDurations.autosaveDebounce, () => unawaited(_save()));
  }

  /// Saves now (before adding to bag / leaving). Returns the design id.
  Future<String?> flush({bool? confirmImageRights}) async {
    _debounce?.cancel();
    await _save(confirmImageRights: confirmImageRights);
    return state.designId;
  }

  Future<void> _save({bool? confirmImageRights}) async {
    final doc = _pending ?? _saved;
    if (doc == null) return;
    if (state.designId == null) {
      _creating ??= _create(doc).whenComplete(() => _creating = null);
      await _creating;
      if (confirmImageRights == null) return;
    }
    final id = state.designId;
    if (id == null) return;
    final body = StudioRepository.patchBody(name: doc.name.isEmpty ? null : doc.name, spec: doc.spec, layers: doc.layers, confirmImageRights: confirmImageRights, fonts: _fonts);
    emit(AutosaveState(designId: id, status: SaveStatus.saving));
    try {
      await _repo.patchRaw(id, body);
      _saved = doc;
      if (identical(_pending, doc)) _pending = null;
      emit(AutosaveState(designId: id, status: SaveStatus.saved));
    } on ApiException catch (e) {
      if (e.isNetwork) {
        await _db.enqueueDesignSave(id, body);
        emit(AutosaveState(designId: id, status: SaveStatus.offline));
      } else {
        emit(AutosaveState(designId: id, status: SaveStatus.error));
      }
    }
  }

  Future<void> _create(DesignDoc doc) async {
    emit(const AutosaveState(status: SaveStatus.saving));
    try {
      final d = await _repo.create(name: doc.name.isEmpty ? null : doc.name, spec: doc.spec, layers: doc.layers, fonts: _fonts);
      _saved = doc;
      if (identical(_pending, doc)) _pending = null;
      emit(AutosaveState(designId: d.id, status: SaveStatus.saved));
    } on ApiException catch (e) {
      emit(AutosaveState(status: e.isNetwork ? SaveStatus.offline : SaveStatus.error));
    }
  }

  /// Replays queued saves (oldest first); stops at the first network failure.
  Future<void> flushQueue() async {
    for (final item in await _db.queuedDesignSaves()) {
      try {
        await _repo.patchRaw(item.designId, (jsonDecode(item.payload) as Map).cast<String, dynamic>());
        await _db.removeDesignSave(item.designId);
        if (item.designId == state.designId) emit(AutosaveState(designId: state.designId, status: SaveStatus.saved));
      } on ApiException catch (e) {
        if (e.isNetwork) return;
        await _db.bumpDesignSaveAttempt(item.designId);
        if (item.attempts >= 3) await _db.removeDesignSave(item.designId);
      }
    }
  }

  @override
  Future<void> close() async {
    _debounce?.cancel();
    await _online.cancel();
    return super.close();
  }
}

// ---------------------------------------------------------------- uploads

class UploadState extends Equatable {
  const UploadState({this.uploading = false, this.progress = 0, this.error, this.tooLarge = false, this.result});

  final bool uploading;
  final double progress;
  final ApiException? error;
  final bool tooLarge;
  final ({DesignUpload upload, String dataUrl})? result;

  @override
  List<Object?> get props => [uploading, progress, error, tooLarge, result];
}

/// Picks an image (gallery or camera), checks the size limit, uploads it with progress and hands back the server
/// upload plus a local data URL for an instant 3D preview.
class UploadCubit extends Cubit<UploadState> {
  UploadCubit(this._repo, {ImagePicker? picker}) : _picker = picker ?? ImagePicker(), super(const UploadState());

  final StudioRepository _repo;
  final ImagePicker _picker;
  CancelToken? _token;

  Future<void> pick(ImageSource source, {required int maxMegabytes}) async {
    final file = await _picker.pickImage(source: source, maxWidth: 4096, maxHeight: 4096);
    if (file == null) return;
    final bytes = await file.readAsBytes();
    if (bytes.length > maxMegabytes * 1024 * 1024) {
      emit(const UploadState(tooLarge: true));
      return;
    }
    await upload(bytes, filename: file.name, contentType: _mime(file.name));
  }

  Future<void> upload(Uint8List bytes, {required String filename, required String contentType}) async {
    _token?.cancel();
    final token = _token = CancelToken();
    emit(const UploadState(uploading: true));
    try {
      final u = await _repo.upload(bytes, filename: filename, contentType: contentType, cancelToken: token, onProgress: (p) {
        if (!isClosed) emit(UploadState(uploading: true, progress: p));
      });
      emit(UploadState(result: (upload: u, dataUrl: 'data:$contentType;base64,${base64Encode(bytes)}')));
    } on ApiException catch (e) {
      if (e.isCancelled) {
        emit(const UploadState());
      } else {
        emit(UploadState(error: e));
      }
    }
  }

  void cancel() => _token?.cancel();

  void consumed() => emit(const UploadState());

  static String _mime(String name) {
    final ext = name.split('.').last.toLowerCase();
    return switch (ext) { 'png' => 'image/png', 'webp' => 'image/webp', 'svg' => 'image/svg+xml', 'heic' => 'image/heic', _ => 'image/jpeg' };
  }
}
