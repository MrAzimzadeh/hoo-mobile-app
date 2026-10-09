import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hoo/core/error/api_exception.dart';
import 'package:hoo/core/network/problem_mapper.dart';

void main() {
  DioException err(int status, Object? body, {Map<String, List<String>> headers = const {}}) {
    final req = RequestOptions(path: '/x');
    return DioException(requestOptions: req, response: Response(requestOptions: req, statusCode: status, data: body, headers: Headers.fromMap(headers)), type: DioExceptionType.badResponse);
  }

  test('maps problem+json with field errors', () {
    final e = ProblemMapper.fromDio(err(400, {
      'code': 'general.validation',
      'title': 'Yoxlayın',
      'errors': {'phone': ['Telefon düzgün deyil']},
      'errorCodes': {'phone': ['phone.invalid']},
    }));
    expect(e.isValidation, isTrue);
    expect(e.code, 'general.validation');
    expect(e.fieldError('Phone'), 'Telefon düzgün deyil');
    expect(e.fieldErrorCodes['phone'], ['phone.invalid']);
  });

  test('reads Retry-After on 429 and recognizes coming soon', () {
    final throttled = ProblemMapper.fromDio(err(429, {'code': 'general.rate_limited'}, headers: {'retry-after': ['42']}));
    expect(throttled.isTooManyRequests, isTrue);
    expect(throttled.retryAfter, const Duration(seconds: 42));
    expect(ProblemMapper.fromDio(err(503, {'code': 'store.coming_soon'})).isComingSoon, isTrue);
  });

  test('network and cancel', () {
    final req = RequestOptions(path: '/x');
    expect(ProblemMapper.fromDio(DioException(requestOptions: req, type: DioExceptionType.connectionError)).isNetwork, isTrue);
    expect(ProblemMapper.fromDio(DioException(requestOptions: req, type: DioExceptionType.cancel)).isCancelled, isTrue);
  });

  test('falls back to a status code when the body has no code', () {
    expect(ProblemMapper.fromDio(err(409, 'oops')).code, ErrorCodes.concurrencyConflict);
  });
}
