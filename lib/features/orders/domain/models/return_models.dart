import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/domain/enums.dart';

part 'return_models.freezed.dart';
part 'return_models.g.dart';

/// `ReturnItem(OrderLineId, Quantity, ExchangeSize?)` — used in requests and in `ReturnResponse`.
@freezed
abstract class ReturnItem with _$ReturnItem {
  const factory ReturnItem({required String orderLineId, required int quantity, @JsonKey(unknownEnumValue: Size.unknown) Size? exchangeSize}) = _ReturnItem;

  factory ReturnItem.fromJson(Map<String, dynamic> json) => _$ReturnItemFromJson(json);
}

/// `ReturnResponse`.
@freezed
abstract class ReturnInfo with _$ReturnInfo {
  const ReturnInfo._();

  const factory ReturnInfo({
    required String id,
    required String orderNumber,
    @Default(ReturnKind.returnItem) ReturnKind kind,
    @JsonKey(unknownEnumValue: ReturnStatus.unknown) @Default(ReturnStatus.unknown) ReturnStatus status,
    @JsonKey(unknownEnumValue: ReturnChannel.unknown) @Default(ReturnChannel.unknown) ReturnChannel channel,
    @Default(<ReturnItem>[]) List<ReturnItem> items,
    String? reason,
    String? resolutionNote,
    required DateTime createdAt,
  }) = _ReturnInfo;

  factory ReturnInfo.fromJson(Map<String, dynamic> json) => _$ReturnInfoFromJson(json);

  int get piecesCount => items.fold(0, (sum, i) => sum + i.quantity);
}

/// `CreateReturnRequest(Kind, Items, Reason?, Phone?)`. `phone` (wire format) is required for guests and ignored
/// by the account endpoint.
class CreateReturnRequest {
  const CreateReturnRequest({required this.kind, required this.items, this.reason, this.phone});

  final ReturnKind kind;
  final List<ReturnItem> items;
  final String? reason;
  final String? phone;

  Map<String, dynamic> toJson() => {
    'kind': kind.wire,
    'items': [for (final i in items) _itemJson(i)],
    'reason': reason,
    'phone': phone,
  };
}

/// `GiftExchangeRequest(Phone, Items, Reason?)` — size exchange by gift receipt (never a refund).
class GiftExchangeRequest {
  const GiftExchangeRequest({required this.phone, required this.items, this.reason});

  final String phone;
  final List<ReturnItem> items;
  final String? reason;

  Map<String, dynamic> toJson() => {
    'phone': phone,
    'items': [for (final i in items) _itemJson(i)],
    'reason': reason,
  };
}

Map<String, dynamic> _itemJson(ReturnItem i) => {'orderLineId': i.orderLineId, 'quantity': i.quantity, 'exchangeSize': i.exchangeSize?.wire};

/// `GiftReceiptLine` — no prices, ever.
@freezed
abstract class GiftReceiptLine with _$GiftReceiptLine {
  const factory GiftReceiptLine({
    required String lineId,
    required String name,
    String? color,
    @JsonKey(unknownEnumValue: Size.unknown) Size? size,
    @Default(1) int quantity,
    @Default(false) bool exchangeable,
    @JsonKey(unknownEnumValue: Size.unknown) @Default(<Size>[]) List<Size> availableSizes,
  }) = _GiftReceiptLine;

  factory GiftReceiptLine.fromJson(Map<String, dynamic> json) => _$GiftReceiptLineFromJson(json);
}

/// `GiftReceiptResponse` — the recipient's price-less view.
@freezed
abstract class GiftReceipt with _$GiftReceipt {
  const factory GiftReceipt({
    required String receiptCode,
    @Default('') String recipientName,
    @JsonKey(unknownEnumValue: Occasion.unknown) @Default(Occasion.unknown) Occasion occasion,
    String? fromName,
    @JsonKey(unknownEnumValue: OrderStatus.unknown) @Default(OrderStatus.unknown) OrderStatus status,
    @Default(<GiftReceiptLine>[]) List<GiftReceiptLine> lines,
    @Default(false) bool exchangeAllowed,
    DateTime? exchangeDeadline,
  }) = _GiftReceipt;

  factory GiftReceipt.fromJson(Map<String, dynamic> json) => _$GiftReceiptFromJson(json);
}
