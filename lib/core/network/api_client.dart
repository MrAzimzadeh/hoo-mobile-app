import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../config/env.dart';
import '../error/api_exception.dart';
import '../security/certificate_pinning.dart';
import '../session/session_store.dart';
import 'interceptors/hoo_interceptors.dart';
import 'problem_mapper.dart';

typedef Decoder<T> = T Function(Object? json);

/// Thin typed facade over Dio for repositories. Every call either returns the decoded body or throws an
/// [ApiException] — never a [DioException]. Pass a [CancelToken] for searches, live pricing and uploads so stale
/// requests can be cancelled.
class ApiClient {
  ApiClient(this.dio);

  final Dio dio;

  static Dio createDio({required Env env, required SessionStore session, HttpClientAdapter? adapter}) {
    final dio = Dio(BaseOptions(
      baseUrl: env.apiRoot,
      connectTimeout: const Duration(seconds: 12),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 60),
      responseType: ResponseType.json,
      headers: {'Accept': 'application/json, application/problem+json'},
    ));
    if (adapter != null) {
      dio.httpClientAdapter = adapter;
    } else if (env.certificatePins.isNotEmpty) {
      dio.httpClientAdapter = CertificatePinning.adapter(env.certificatePins);
    }
    dio.interceptors.addAll([
      SessionInterceptor(session),
      GuestInterceptor(session),
      LanguageInterceptor(session),
      IdempotencyInterceptor(),
      if (env.enableNetworkLogs) RedactingLogInterceptor(),
    ]);
    return dio;
  }

  Future<T> get<T>(String path, {Map<String, dynamic>? query, Decoder<T>? decode, CancelToken? cancelToken, Options? options}) =>
      _run(() => dio.get<Object?>(path, queryParameters: _clean(query), cancelToken: cancelToken, options: options), decode);

  Future<T> post<T>(String path, {Object? body, Map<String, dynamic>? query, Decoder<T>? decode, CancelToken? cancelToken, String? idempotencyKey, Options? options}) =>
      _run(() => dio.post<Object?>(path, data: body, queryParameters: _clean(query), cancelToken: cancelToken, options: _withKey(options, idempotencyKey)), decode);

  Future<T> put<T>(String path, {Object? body, Decoder<T>? decode, CancelToken? cancelToken}) =>
      _run(() => dio.put<Object?>(path, data: body, cancelToken: cancelToken), decode);

  Future<T> patch<T>(String path, {Object? body, Decoder<T>? decode, CancelToken? cancelToken}) =>
      _run(() => dio.patch<Object?>(path, data: body, cancelToken: cancelToken), decode);

  Future<T> delete<T>(String path, {Object? body, Map<String, dynamic>? query, Decoder<T>? decode, CancelToken? cancelToken}) =>
      _run(() => dio.delete<Object?>(path, data: body, queryParameters: _clean(query), cancelToken: cancelToken), decode);

  /// Multipart upload with progress (0..1).
  Future<T> upload<T>(
    String path, {
    required Uint8List bytes,
    required String filename,
    required String contentType,
    String field = 'file',
    Decoder<T>? decode,
    CancelToken? cancelToken,
    void Function(double progress)? onProgress,
  }) {
    final form = FormData.fromMap({field: MultipartFile.fromBytes(bytes, filename: filename, contentType: DioMediaType.parse(contentType))});
    return _run(
      () => dio.post<Object?>(path, data: form, cancelToken: cancelToken, onSendProgress: (sent, total) {
        if (total > 0) onProgress?.call(sent / total);
      }),
      decode,
    );
  }

  /// Raw bytes (GLB models, images that must be passed to the 3D engine).
  Future<Uint8List> bytes(String pathOrUrl, {CancelToken? cancelToken}) async {
    try {
      final r = await dio.get<List<int>>(pathOrUrl, options: Options(responseType: ResponseType.bytes), cancelToken: cancelToken);
      return Uint8List.fromList(r.data ?? const []);
    } on DioException catch (e) {
      throw ProblemMapper.fromDio(e);
    }
  }

  /// Absolute URL for a backend-relative asset path (`/api/v1/studio/templates/…/model.glb`, `/media/…`).
  String absolute(String pathOrUrl) {
    if (pathOrUrl.startsWith('http://') || pathOrUrl.startsWith('https://') || pathOrUrl.startsWith('data:')) return pathOrUrl;
    final base = Uri.parse(dio.options.baseUrl);
    return base.replace(path: pathOrUrl.startsWith('/') ? pathOrUrl.split('?').first : '/${pathOrUrl.split('?').first}', query: pathOrUrl.contains('?') ? pathOrUrl.split('?').last : null).toString();
  }

  Future<T> _run<T>(Future<Response<Object?>> Function() call, Decoder<T>? decode) async {
    try {
      final response = await call();
      if (decode != null) return decode(response.data);
      return response.data as T;
    } on DioException catch (e) {
      throw ProblemMapper.fromDio(e);
    } on SocketException {
      throw const ApiException.network();
    }
  }

  static Options? _withKey(Options? options, String? key) {
    if (key == null) return options;
    final o = options ?? Options();
    return o.copyWith(extra: {...?o.extra, IdempotencyInterceptor.extraKey: key});
  }

  /// Drops nulls/empty lists; lists are sent as repeated keys (`sizes=M&sizes=L`), which ASP.NET binds to arrays.
  static Map<String, dynamic>? _clean(Map<String, dynamic>? q) {
    if (q == null) return null;
    final out = <String, dynamic>{};
    q.forEach((k, v) {
      if (v == null) return;
      if (v is Iterable && v.isEmpty) return;
      if (v is String && v.isEmpty) return;
      out[k] = v is Iterable ? v.map((e) => e.toString()).toList() : v;
    });
    return out;
  }
}

/// Decoders for common shapes.
abstract final class Decoders {
  static Map<String, dynamic> map(Object? json) => (json as Map).cast<String, dynamic>();

  static List<T> list<T>(Object? json, T Function(Map<String, dynamic>) item) =>
      (json as List? ?? const []).map((e) => item((e as Map).cast<String, dynamic>())).toList();

  static List<String> strings(Object? json) => (json as List? ?? const []).map((e) => e.toString()).toList();
}
