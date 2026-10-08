import 'dart:convert';

import 'package:dio/dio.dart';

import '../error/api_exception.dart';

/// 6. problem+json → [ApiException]. Applied by [ApiClient] to every failed call, so nothing above the data
/// layer ever sees a raw [DioException].
abstract final class ProblemMapper {
  static String? codeOf(Object? data) {
    final map = _asMap(data);
    final code = map?['code'];
    return code is String && code.isNotEmpty ? code : null;
  }

  static ApiException fromDio(DioException e) {
    if (e.type == DioExceptionType.cancel) return const ApiException.cancelled();
    final response = e.response;
    if (response == null) {
      return const ApiException.network();
    }
    final status = response.statusCode ?? 500;
    final map = _asMap(response.data) ?? const {};
    final retryHeader = response.headers.value('retry-after');
    final retrySeconds = retryHeader == null ? null : int.tryParse(retryHeader);
    return ApiException(
      statusCode: status,
      code: (map['code'] as String?)?.isNotEmpty == true ? map['code'] as String : _fallbackCode(status),
      title: map['title'] as String?,
      detail: map['detail'] as String?,
      field: map['field'] as String?,
      fieldErrors: _stringListMap(map['errors']),
      fieldErrorCodes: _stringListMap(map['errorCodes']),
      args: (map['args'] as Map?)?.cast<String, Object?>() ?? const {},
      retryAfter: retrySeconds == null ? null : Duration(seconds: retrySeconds),
    );
  }

  static String _fallbackCode(int status) => switch (status) {
        400 => ErrorCodes.validation,
        401 => ErrorCodes.unauthenticated,
        404 => 'general.not_found',
        409 => ErrorCodes.concurrencyConflict,
        429 => ErrorCodes.rateLimited,
        _ => ErrorCodes.unknown,
      };

  static Map<String, dynamic>? _asMap(Object? data) {
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return data.cast<String, dynamic>();
    if (data is String && data.trim().startsWith('{')) {
      try {
        return jsonDecode(data) as Map<String, dynamic>;
      } catch (_) {
        return null;
      }
    }
    return null;
  }

  static Map<String, List<String>> _stringListMap(Object? v) {
    if (v is! Map) return const {};
    return v.map((k, list) => MapEntry(k.toString(), list is List ? list.map((e) => e.toString()).toList() : [list.toString()]));
  }
}
