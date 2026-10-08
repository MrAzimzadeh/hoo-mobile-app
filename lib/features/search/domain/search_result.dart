import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/domain/models.dart';

part 'search_result.freezed.dart';
part 'search_result.g.dart';

/// `GET /search` → `SearchResponse { query, items, totalCount, suggestDesignYourOwn }`.
///
/// [query] is the server-normalised query (trimmed, lower-cased). [suggestDesignYourOwn] is set when few products
/// match — the UI then offers "Design your own in 3D".
@freezed
abstract class SearchResult with _$SearchResult {
  const factory SearchResult({
    @Default('') String query,
    @Default(<ProductCard>[]) List<ProductCard> items,
    @Default(0) int totalCount,
    @Default(false) bool suggestDesignYourOwn,
  }) = _SearchResult;

  factory SearchResult.fromJson(Map<String, dynamic> json) => _$SearchResultFromJson(json);
}
