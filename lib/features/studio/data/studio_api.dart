import 'dart:typed_data';

import 'package:dio/dio.dart' show CancelToken;

import '../../../core/network/api_client.dart';
import '../../../shared/domain/enums.dart';
import '../domain/models/design.dart';
import '../domain/models/studio_config.dart';
import '../domain/models/studio_responses.dart';

/// HTTP for the Studio (`/studio/**`), mirroring `Hoo.Api/Endpoints/Studio/StudioEndpoints.cs`.
class StudioApi {
  StudioApi(this._api);

  final ApiClient _api;

  Future<Object?> configJson({String? product}) => _api.get<Object?>('/studio/config', query: {'product': product});

  Future<StudioQuote> price(Map<String, dynamic> body, {CancelToken? cancelToken}) =>
      _api.post('/studio/price', body: body, cancelToken: cancelToken, decode: (j) => StudioQuote.fromJson(Decoders.map(j)));

  Future<DesignUpload> upload(Uint8List bytes, {required String filename, required String contentType, CancelToken? cancelToken, void Function(double)? onProgress}) =>
      _api.upload(
        '/studio/uploads',
        bytes: bytes,
        filename: filename,
        contentType: contentType,
        cancelToken: cancelToken,
        onProgress: onProgress,
        decode: (j) => DesignUpload.fromJson(Decoders.map(j)),
      );

  Future<List<DesignListItem>> designs({DesignStatus? status}) =>
      _api.get('/studio/designs', query: {'status': status?.wire}, decode: (j) => Decoders.list(j, DesignListItem.fromJson));

  Future<StudioDesign> design(String id) => _api.get('/studio/designs/$id', decode: _design);

  Future<StudioDesign> create(Map<String, dynamic> body) => _api.post('/studio/designs', body: body, decode: _design);

  Future<StudioDesign> patch(String id, Map<String, dynamic> body) => _api.patch('/studio/designs/$id', body: body, decode: _design);

  Future<void> delete(String id) => _api.delete<void>('/studio/designs/$id');

  Future<StudioDesign> duplicate(String id) => _api.post('/studio/designs/$id/duplicate', decode: _design);

  /// The endpoint returns the URL as a JSON string; tolerate an object `{ url }` too.
  Future<String> share(String id) => _api.post('/studio/designs/$id/share', decode: (j) {
        if (j is String) return j;
        if (j is Map) return (j['url'] ?? j['shareUrl'] ?? '').toString();
        return j?.toString() ?? '';
      });

  Future<StudioDesign> resubmit(String id) => _api.post('/studio/designs/$id/resubmit', decode: _design);

  Future<StudioDesign> mockup(String id, Uint8List png, {required String filename, CancelToken? cancelToken}) =>
      _api.upload('/studio/designs/$id/mockups', bytes: png, filename: filename, contentType: 'image/png', cancelToken: cancelToken, decode: _design);

  Future<StudioDesign> shared(String token) => _api.get('/studio/shared/${Uri.encodeComponent(token)}', decode: _design);

  /// `GET /account/style-profile` → `{ usualSize, preferredFit, … }` (signed-in only).
  Future<Map<String, dynamic>> styleProfile() => _api.get('/account/style-profile', decode: Decoders.map);

  static StudioDesign _design(Object? j) => StudioDesign.fromJson(Decoders.map(j));

  static Map<String, dynamic> quoteBody(DesignSpec spec, List<DesignLayer> layers, String? pricingVersionId) => {
        'spec': spec.toJson(),
        'layers': [for (final l in layers) l.toJson()],
        'pricingVersionId': ?pricingVersionId,
      };

  static StudioConfig decodeConfig(Object? json) => StudioConfig.fromJson(Decoders.map(json));
}
