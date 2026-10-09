import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../../core/network/api_client.dart';
import '../domain/layer_ops.dart';
import '../domain/models/design.dart';
import '../domain/models/studio_config.dart';

/// `/studio/*`. Every call throws `ApiException` (branch on `studio.*`, `file.too_large`, `file.type_not_allowed`).
class StudioRepository {
  StudioRepository(this._api);
  final ApiClient _api;

  String _d(String id) => '/studio/designs/${Uri.encodeComponent(id)}';
  StudioDesign _design(Object? j) => StudioDesign.fromJson(Decoders.map(j));

  /// [productSlug] preselects a catalog product as a base (`p-<productId>`).
  Future<StudioConfig> config({String? productSlug}) =>
      _api.get('/studio/config', query: {'product': productSlug}, decode: (j) => StudioConfig.fromJson(Decoders.map(j)));

  /// Live price — always from the server; [cancelToken] drops stale quotes.
  Future<StudioQuote> quote(DesignSpec spec, List<DesignLayer> layers, {required String pricingVersionId, required List<String> fonts, CancelToken? cancelToken}) => _api.post(
        '/studio/price',
        body: {'spec': spec.toJson(), 'layers': [for (final l in toApiLayers(layers, fonts)) l.toJson()], 'pricingVersionId': pricingVersionId},
        decode: (j) => StudioQuote.fromJson(Decoders.map(j)),
        cancelToken: cancelToken,
      );

  Future<DesignUpload> upload(Uint8List bytes, {required String filename, required String contentType, void Function(double)? onProgress, CancelToken? cancelToken}) => _api.upload(
        '/studio/uploads',
        bytes: bytes,
        filename: filename,
        contentType: contentType,
        onProgress: onProgress,
        cancelToken: cancelToken,
        decode: (j) => DesignUpload.fromJson(Decoders.map(j)),
      );

  Future<List<DesignListItem>> designs() => _api.get('/studio/designs', decode: (j) => Decoders.list(j, DesignListItem.fromJson));

  Future<StudioDesign> design(String id) => _api.get(_d(id), decode: _design);

  Future<StudioDesign> create({String? name, required DesignSpec spec, required List<DesignLayer> layers, required List<String> fonts}) => _api.post(
        '/studio/designs',
        body: {'name': name, 'spec': spec.toJson(), 'layers': [for (final l in toApiLayers(layers, fonts)) l.toJson()]},
        decode: _design,
      );

  /// Raw PATCH body — the autosave queue stores and replays exactly this.
  Future<StudioDesign> patchRaw(String id, Map<String, dynamic> body) => _api.patch(_d(id), body: body, decode: _design);

  static Map<String, dynamic> patchBody({String? name, DesignSpec? spec, List<DesignLayer>? layers, bool? confirmImageRights, required List<String> fonts}) => {
        'name': name,
        'spec': spec?.toJson(),
        'layers': layers == null ? null : [for (final l in toApiLayers(layers, fonts)) l.toJson()],
        'confirmImageRights': confirmImageRights,
      };

  Future<void> delete(String id) => _api.delete<Object?>(_d(id));
  Future<StudioDesign> duplicate(String id) => _api.post('${_d(id)}/duplicate', decode: _design);
  Future<String> share(String id) => _api.post('${_d(id)}/share', decode: (j) => j.toString());
  Future<StudioDesign> resubmit(String id) => _api.post('${_d(id)}/resubmit', decode: _design);

  Future<StudioDesign> uploadMockup(String id, Uint8List png, {required String name}) =>
      _api.upload('${_d(id)}/mockups', bytes: png, filename: '$name.png', contentType: 'image/png', decode: _design);

  Future<StudioDesign> shared(String token) => _api.get('/studio/shared/${Uri.encodeComponent(token)}', decode: _design);

  /// GLB bytes for the WebView engine (fetched by Flutter, so auth/proxy rules stay in one place).
  Future<Uint8List> modelBytes(String modelUrl) => _api.bytes(_api.absolute(modelUrl));

  String absolute(String url) => _api.absolute(url);
}
