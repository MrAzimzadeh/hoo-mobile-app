import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:hoo/core/network/api_client.dart';

/// Recorded request for assertions.
class RecordedRequest {
  RecordedRequest(this.method, this.path, this.query, this.body, this.headers);
  final String method;
  final String path;
  final Map<String, dynamic> query;
  final Object? body;
  final Map<String, dynamic> headers;
}

typedef FakeHandler = (int status, Object? body) Function(RecordedRequest request);

/// Dio adapter answering from a route table: `'GET /cart': (req) => (200, {...})`.
/// Unmatched routes return 404 problem+json. Use [ApiClient] on top so repositories are tested end-to-end
/// (query building, JSON decoding, problem mapping).
class FakeApiAdapter implements HttpClientAdapter {
  FakeApiAdapter(this.routes);

  final Map<String, FakeHandler> routes;
  final requests = <RecordedRequest>[];

  @override
  Future<ResponseBody> fetch(RequestOptions options, Stream<Uint8List>? requestStream, Future<void>? cancelFuture) async {
    final path = options.path.startsWith('http') ? Uri.parse(options.path).path.replaceFirst('/api/v1', '') : options.path;
    final req = RecordedRequest(options.method, path, options.queryParameters, options.data, options.headers);
    requests.add(req);
    final key = '${options.method} $path';
    FakeHandler? handler = routes[key];
    if (handler == null) {
      for (final e in routes.entries) {
        final parts = e.key.split(' ');
        if (parts.first == options.method && _match(parts.last, path)) {
          handler = e.value;
          break;
        }
      }
    }
    final (status, body) = handler?.call(req) ?? (404, {'code': 'general.not_found', 'title': 'Not found', 'status': 404});
    final isProblem = status >= 400;
    return ResponseBody.fromString(
      body == null ? '' : jsonEncode(body),
      status,
      headers: {
        Headers.contentTypeHeader: [isProblem ? 'application/problem+json' : 'application/json'],
      },
    );
  }

  /// `/catalog/products/{slug}` style patterns.
  static bool _match(String pattern, String path) {
    final a = pattern.split('/'), b = path.split('/');
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i].startsWith('{') && a[i].endsWith('}')) continue;
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  @override
  void close({bool force = false}) {}
}

/// An [ApiClient] backed by [FakeApiAdapter].
ApiClient fakeApiClient(Map<String, FakeHandler> routes, {FakeApiAdapter? adapter}) {
  final a = adapter ?? FakeApiAdapter(routes);
  final dio = Dio(BaseOptions(baseUrl: 'http://test/api/v1'))..httpClientAdapter = a;
  return ApiClient(dio);
}
