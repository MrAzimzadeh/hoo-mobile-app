import 'dart:typed_data';

import 'package:dio/dio.dart' show CancelToken;

import '../../../core/storage/cached.dart';
import '../../../shared/domain/enums.dart';
import 'models/design.dart';
import 'models/studio_config.dart';
import 'models/studio_responses.dart';

/// Narrow repositories at the Studio's data boundary. Implementations live in `data/`.

/// `GET /studio/config` — cached per language (and per `?product=`), offline fallback flagged `stale`.
abstract interface class StudioConfigRepository {
  /// [product] = catalog slug or `p-<id>` (opened from a PDP): that product is prepended as a base.
  Future<Cached<StudioConfig>> config({String? product, bool refresh = false});

  /// The signed-in customer's preferred size/fit from the style profile (best effort, null when unknown).
  Future<({Size? size, Fit? fit})> stylePreferences();
}

/// `POST /studio/price`.
abstract interface class StudioPricingRepository {
  Future<StudioQuote> quote({required DesignSpec spec, required List<DesignLayer> layers, String? pricingVersionId, CancelToken? cancelToken});
}

/// `POST /studio/uploads` (multipart, progress).
abstract interface class StudioUploadRepository {
  Future<DesignUpload> upload(Uint8List bytes, {required String filename, required String contentType, CancelToken? cancelToken, void Function(double progress)? onProgress});
}

/// `/studio/designs/**` and `/studio/shared/{token}`.
abstract interface class StudioDesignRepository {
  Future<List<DesignListItem>> list({DesignStatus? status});
  Future<StudioDesign> get(String id);
  Future<StudioDesign> create({String? name, required DesignSpec spec, required List<DesignLayer> layers});

  /// Only non-null fields change. [payload] is the exact JSON body (so the offline queue can replay it).
  Future<StudioDesign> patch(String id, Map<String, dynamic> payload);
  Future<void> delete(String id);
  Future<StudioDesign> duplicate(String id);

  /// Returns the public read-only link.
  Future<String> share(String id);
  Future<StudioDesign> resubmit(String id);
  Future<StudioDesign> uploadMockup(String id, Uint8List png, {required String filename, CancelToken? cancelToken});
  Future<StudioDesign> shared(String token);
}

/// Body builders shared by the pricing cubit, autosave and repositories (the only place that shapes payloads).
abstract final class StudioPayloads {
  static Map<String, dynamic> update({String? name, DesignSpec? spec, List<DesignLayer>? layers, bool? confirmImageRights}) => {
        'name': ?name,
        if (spec != null) 'spec': spec.toJson(),
        if (layers != null) 'layers': [for (final l in layers) l.toJson()],
        'confirmImageRights': ?confirmImageRights,
      };
}
