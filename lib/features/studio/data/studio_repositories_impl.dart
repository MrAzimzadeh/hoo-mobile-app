import 'dart:typed_data';

import 'package:dio/dio.dart' show CancelToken;

import '../../../core/storage/app_database.dart';
import '../../../core/storage/cached.dart';
import '../../../shared/domain/enums.dart';
import '../domain/models/design.dart';
import '../domain/models/studio_config.dart';
import '../domain/models/studio_responses.dart';
import '../domain/studio_repositories.dart';
import 'studio_api.dart';

/// Config is versioned server-side (`pricingVersionId`) and rarely changes: memoised for [ttl] per language/product,
/// persisted to the Drift cache for the offline fallback.
class StudioConfigRepositoryImpl implements StudioConfigRepository {
  StudioConfigRepositoryImpl(this._api, this._db, {required String Function() language, required bool Function() signedIn, this.ttl = const Duration(minutes: 10)})
      : _language = language,
        _signedIn = signedIn;

  final StudioApi _api;
  final AppDatabase _db;
  final String Function() _language;
  final bool Function() _signedIn;
  final Duration ttl;
  final _memo = <String, ({Cached<StudioConfig> value, DateTime at})>{};
  ({Size? size, Fit? fit})? _style;

  @override
  Future<Cached<StudioConfig>> config({String? product, bool refresh = false}) async {
    final lang = _language();
    final key = 'studio.config${product == null ? '' : ':$product'}';
    final memoKey = '$lang|$key';
    final hit = _memo[memoKey];
    if (!refresh && hit != null && !hit.value.stale && DateTime.now().difference(hit.at) < ttl) return hit.value;
    final result = await cachedFetch(db: _db, key: key, language: lang, fetchJson: () => _api.configJson(product: product), decode: StudioApi.decodeConfig);
    _memo[memoKey] = (value: result, at: DateTime.now());
    return result;
  }

  @override
  Future<({Size? size, Fit? fit})> stylePreferences() async {
    if (!_signedIn()) return (size: null, fit: null);
    final cached = _style;
    if (cached != null) return cached;
    try {
      final json = await _api.styleProfile();
      final size = Size.fromWire(json['usualSize'] as String?);
      final fit = Fit.fromWire(json['preferredFit'] as String?);
      return _style = (size: size == Size.unknown ? null : size, fit: fit == Fit.unknown ? null : fit);
    } on Object {
      // A missing style profile (404) or a network hiccup only means "no preselection".
      return (size: null, fit: null);
    }
  }

  void invalidate() {
    _memo.clear();
    _style = null;
  }
}

class StudioPricingRepositoryImpl implements StudioPricingRepository {
  StudioPricingRepositoryImpl(this._api);
  final StudioApi _api;

  @override
  Future<StudioQuote> quote({required DesignSpec spec, required List<DesignLayer> layers, String? pricingVersionId, CancelToken? cancelToken}) =>
      _api.price(StudioApi.quoteBody(spec, layers, pricingVersionId), cancelToken: cancelToken);
}

class StudioUploadRepositoryImpl implements StudioUploadRepository {
  StudioUploadRepositoryImpl(this._api);
  final StudioApi _api;

  @override
  Future<DesignUpload> upload(Uint8List bytes, {required String filename, required String contentType, CancelToken? cancelToken, void Function(double progress)? onProgress}) =>
      _api.upload(bytes, filename: filename, contentType: contentType, cancelToken: cancelToken, onProgress: onProgress);
}

class StudioDesignRepositoryImpl implements StudioDesignRepository {
  StudioDesignRepositoryImpl(this._api);
  final StudioApi _api;

  @override
  Future<List<DesignListItem>> list({DesignStatus? status}) => _api.designs(status: status);

  @override
  Future<StudioDesign> get(String id) => _api.design(id);

  @override
  Future<StudioDesign> create({String? name, required DesignSpec spec, required List<DesignLayer> layers}) => _api.create({
        'name': ?name,
        'spec': spec.toJson(),
        'layers': [for (final l in layers) l.toJson()],
      });

  @override
  Future<StudioDesign> patch(String id, Map<String, dynamic> payload) => _api.patch(id, payload);

  @override
  Future<void> delete(String id) => _api.delete(id);

  @override
  Future<StudioDesign> duplicate(String id) => _api.duplicate(id);

  @override
  Future<String> share(String id) => _api.share(id);

  @override
  Future<StudioDesign> resubmit(String id) => _api.resubmit(id);

  @override
  Future<StudioDesign> uploadMockup(String id, Uint8List png, {required String filename, CancelToken? cancelToken}) =>
      _api.mockup(id, png, filename: filename, cancelToken: cancelToken);

  @override
  Future<StudioDesign> shared(String token) => _api.shared(token);
}
