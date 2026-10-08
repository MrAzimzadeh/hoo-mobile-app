import 'dart:convert';

import '../../../core/network/api_client.dart';

/// Fetches a GLB template (`GET /studio/templates/{id}/model.glb`) as base64 for the 3D engine. Models are kept in
/// memory — switching steps or products never downloads the same garment twice.
class TemplateModelLoader {
  TemplateModelLoader(this._api);

  final ApiClient _api;
  final _cache = <String, Future<String>>{};

  Future<String> base64Of(String modelUrl) => _cache.putIfAbsent(modelUrl, () async {
    try {
      return base64Encode(await _api.bytes(modelUrl));
    } on Object {
      _cache.remove(modelUrl);
      rethrow;
    }
  });
}
