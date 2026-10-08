import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/network/api_client.dart';
import '../../domain/models/design.dart';
import '../../domain/studio_repositories.dart';

enum PickSource { gallery, camera }

class PickedImage {
  const PickedImage({required this.bytes, required this.filename, required this.contentType});
  final Uint8List bytes;
  final String filename;
  final String contentType;
}

/// Gallery / camera access (a seam for tests).
abstract interface class ImagePickerGateway {
  Future<PickedImage?> pick(PickSource source);
}

class PlatformImagePicker implements ImagePickerGateway {
  PlatformImagePicker([ImagePicker? picker]) : _picker = picker ?? ImagePicker();

  final ImagePicker _picker;

  @override
  Future<PickedImage?> pick(PickSource source) async {
    final file = await _picker.pickImage(source: source == PickSource.camera ? ImageSource.camera : ImageSource.gallery, requestFullMetadata: false);
    if (file == null) return null;
    final name = file.name.isEmpty ? 'image.jpg' : file.name;
    return PickedImage(bytes: await file.readAsBytes(), filename: name, contentType: contentTypeOf(file.mimeType, name));
  }

  static String contentTypeOf(String? mime, String name) {
    if (mime != null && mime.startsWith('image/')) return mime;
    final ext = name.split('.').last.toLowerCase();
    return switch (ext) {
      'png' => 'image/png',
      'webp' => 'image/webp',
      'svg' => 'image/svg+xml',
      _ => 'image/jpeg',
    };
  }
}

enum UploadProblem { tooLarge, unsupported, failed }

class UploadsState extends Equatable {
  const UploadsState({this.uploading = false, this.progress = 0, this.problem, this.error, this.uploaded, this.uploadedCount = 0, this.images = const {}});

  final bool uploading;
  final double progress;
  final UploadProblem? problem;
  final ApiException? error;

  /// The upload that just finished — the page adds it as a layer, then calls [UploadsCubit.consumed].
  final DesignUpload? uploaded;
  final int uploadedCount;

  /// `uploadId` → data URL for the 3D engine (no CORS or auth issues inside the WebView).
  final Map<String, String> images;

  UploadsState copyWith({bool? uploading, double? progress, Object? problem = _keep, Object? error = _keep, Object? uploaded = _keep, int? uploadedCount, Map<String, String>? images}) => UploadsState(
    uploading: uploading ?? this.uploading,
    progress: progress ?? this.progress,
    problem: identical(problem, _keep) ? this.problem : problem as UploadProblem?,
    error: identical(error, _keep) ? this.error : error as ApiException?,
    uploaded: identical(uploaded, _keep) ? this.uploaded : uploaded as DesignUpload?,
    uploadedCount: uploadedCount ?? this.uploadedCount,
    images: images ?? this.images,
  );

  @override
  List<Object?> get props => [uploading, progress, problem, error, uploaded, uploadedCount, images];
}

const _keep = Object();

/// Picks an image, validates it, uploads it with progress (cancellable) and keeps the image data the 3D engine
/// needs for every upload of the design.
class UploadsCubit extends Cubit<UploadsState> {
  UploadsCubit(this._repo, this._picker, this._api, {this.maxMegabytes = 20}) : super(const UploadsState());

  final StudioUploadRepository _repo;
  final ImagePickerGateway _picker;
  final ApiClient _api;
  int maxMegabytes;
  CancelToken? _token;

  static const allowed = {'image/png', 'image/jpeg', 'image/webp', 'image/svg+xml'};

  Future<void> pick(PickSource source) async {
    if (state.uploading) return;
    final PickedImage? image;
    try {
      image = await _picker.pick(source);
    } on Object {
      emit(state.copyWith(problem: UploadProblem.failed, error: null));
      return;
    }
    if (image == null) return;
    if (!allowed.contains(image.contentType)) {
      emit(state.copyWith(problem: UploadProblem.unsupported, error: null));
      return;
    }
    if (image.bytes.length > maxMegabytes * 1024 * 1024) {
      emit(state.copyWith(problem: UploadProblem.tooLarge, error: null));
      return;
    }
    final token = _token = CancelToken();
    emit(state.copyWith(uploading: true, progress: 0, problem: null, error: null));
    try {
      final upload = await _repo.upload(image.bytes, filename: image.filename, contentType: image.contentType, cancelToken: token, onProgress: (p) {
        if (!isClosed && !token.isCancelled) emit(state.copyWith(progress: p));
      });
      if (isClosed) return;
      emit(state.copyWith(
        uploading: false,
        progress: 1,
        uploaded: upload,
        uploadedCount: state.uploadedCount + 1,
        images: {...state.images, upload.id: 'data:${image.contentType};base64,${base64Encode(image.bytes)}'},
      ));
    } on ApiException catch (e) {
      if (isClosed) return;
      emit(state.copyWith(uploading: false, problem: e.isCancelled ? null : UploadProblem.failed, error: e.isCancelled ? null : e));
    }
  }

  void cancel() {
    _token?.cancel();
  }

  void consumed() => emit(state.copyWith(uploaded: null));

  void dismissProblem() => emit(state.copyWith(problem: null, error: null));

  /// Loads the images of uploads that came with a saved design.
  Future<void> seed(List<DesignUpload> uploads) async {
    for (final u in uploads) {
      if (state.images.containsKey(u.id) || isClosed) continue;
      try {
        final bytes = await _api.bytes(u.url);
        if (isClosed) return;
        final type = u.contentType.isEmpty ? 'image/png' : u.contentType;
        emit(state.copyWith(images: {...state.images, u.id: 'data:$type;base64,${base64Encode(bytes)}'}));
      } on ApiException {
        // the layer renders as a placeholder; a later seed retries
      }
    }
  }

  @override
  Future<void> close() {
    _token?.cancel();
    return super.close();
  }
}
