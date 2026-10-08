import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

/// In-app fake backend for the `HOO_MOCK=true` flavor flag: answers every `/api/v1` call from JSON fixtures in
/// `assets/fixtures/` (stateful where it matters: bag, checkout, wishlist, studio designs), so the whole UI runs
/// without a server. Implemented in `mock_backend.dart`.
class MockBackendAdapter implements HttpClientAdapter {
  MockBackendAdapter();

  @override
  Future<ResponseBody> fetch(RequestOptions options, Stream<Uint8List>? requestStream, Future<void>? cancelFuture) async {
    return ResponseBody.fromString(
      jsonEncode({'code': 'mock.not_implemented', 'title': 'Mock backend not implemented', 'status': 501}),
      501,
      headers: {Headers.contentTypeHeader: ['application/problem+json']},
    );
  }

  @override
  void close({bool force = false}) {}
}
