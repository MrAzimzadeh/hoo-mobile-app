import '../../../shared/domain/enums.dart';
import 'models/order_models.dart';
import 'models/return_models.dart';

/// Why a return request can't be sent yet. The UI maps these to localized messages.
enum ReturnFormIssue { noItems, exchangeSizeMissing, exchangeSameSize, reasonTooLong, phoneInvalid }

/// Pure, immutable state of the return/exchange form (pick lines + quantities, kind, new size, reason, phone).
/// All rules mirror `CreateReturnRequestValidator`; the server re-validates (window, returnability, stock).
class ReturnForm {
  const ReturnForm({
    required this.lines,
    this.kind = ReturnKind.returnItem,
    this.quantities = const {},
    this.exchangeSizes = const {},
    this.reason = '',
    this.phoneDigits,
  });

  /// Builds the form for [order]; only returnable lines can be picked. [guestPhone] (wire format) switches on the
  /// phone field required by the guest endpoint.
  factory ReturnForm.forOrder(OrderDetail order, {String? guestPhone}) =>
      ReturnForm(lines: order.returnableLines, phoneDigits: guestPhone == null ? null : nationalDigits(guestPhone));

  static const reasonMaxLength = 500;

  final List<OrderLine> lines;
  final ReturnKind kind;

  /// lineId → quantity (only selected lines).
  final Map<String, int> quantities;

  /// lineId → new size (exchange only).
  final Map<String, Size> exchangeSizes;
  final String reason;

  /// 9 national digits for guests; null for signed-in customers (the account endpoint ignores the phone).
  final String? phoneDigits;

  bool get needsPhone => phoneDigits != null;
  bool isSelected(String lineId) => quantities.containsKey(lineId);
  int quantityOf(String lineId) => quantities[lineId] ?? 0;
  int get selectedPieces => quantities.values.fold(0, (a, b) => a + b);

  OrderLine? _line(String id) {
    for (final l in lines) {
      if (l.id == id) return l;
    }
    return null;
  }

  ReturnForm copyWith({ReturnKind? kind, Map<String, int>? quantities, Map<String, Size>? exchangeSizes, String? reason, String? phoneDigits}) => ReturnForm(
    lines: lines,
    kind: kind ?? this.kind,
    quantities: quantities ?? this.quantities,
    exchangeSizes: exchangeSizes ?? this.exchangeSizes,
    reason: reason ?? this.reason,
    phoneDigits: phoneDigits ?? this.phoneDigits,
  );

  ReturnForm withKind(ReturnKind k) => copyWith(kind: k);

  /// Selects a line with its full quantity, or deselects it (and forgets its exchange size).
  ReturnForm toggle(String lineId) {
    final line = _line(lineId);
    if (line == null) return this;
    if (isSelected(lineId)) {
      return copyWith(quantities: {...quantities}..remove(lineId), exchangeSizes: {...exchangeSizes}..remove(lineId));
    }
    return copyWith(quantities: {...quantities, lineId: line.quantity});
  }

  /// Quantity clamped to 1…ordered quantity. 0 deselects.
  ReturnForm withQuantity(String lineId, int quantity) {
    final line = _line(lineId);
    if (line == null) return this;
    if (quantity <= 0) return isSelected(lineId) ? toggle(lineId) : this;
    return copyWith(quantities: {...quantities, lineId: quantity.clamp(1, line.quantity)});
  }

  ReturnForm withExchangeSize(String lineId, Size size) => copyWith(exchangeSizes: {...exchangeSizes, lineId: size});
  ReturnForm withReason(String r) => copyWith(reason: r);
  ReturnForm withPhone(String input) => needsPhone ? copyWith(phoneDigits: nationalDigits(input)) : this;

  /// Every problem with the current input; empty → ready to send.
  Set<ReturnFormIssue> get issues {
    final out = <ReturnFormIssue>{};
    if (quantities.isEmpty) out.add(ReturnFormIssue.noItems);
    if (kind == ReturnKind.exchange) {
      for (final id in quantities.keys) {
        final size = exchangeSizes[id];
        if (size == null) {
          out.add(ReturnFormIssue.exchangeSizeMissing);
        } else if (size == _line(id)?.size) {
          out.add(ReturnFormIssue.exchangeSameSize);
        }
      }
    }
    if (reason.trim().length > reasonMaxLength) out.add(ReturnFormIssue.reasonTooLong);
    if (needsPhone && phoneDigits!.length != 9) out.add(ReturnFormIssue.phoneInvalid);
    return out;
  }

  bool get isValid => issues.isEmpty;

  /// Lines whose exchange size still needs picking (to highlight them).
  Set<String> get linesMissingSize =>
      kind == ReturnKind.exchange ? quantities.keys.where((id) => exchangeSizes[id] == null || exchangeSizes[id] == _line(id)?.size).toSet() : const {};

  /// The request body. Call only when [isValid].
  CreateReturnRequest toRequest() {
    final r = reason.trim();
    return CreateReturnRequest(
      kind: kind,
      items: [
        for (final l in lines)
          if (quantities[l.id] case final q?)
            ReturnItem(orderLineId: l.id, quantity: q, exchangeSize: kind == ReturnKind.exchange ? exchangeSizes[l.id] : null),
      ],
      reason: r.isEmpty ? null : r,
      phone: needsPhone ? '+994$phoneDigits' : null,
    );
  }

  /// "+994 50 123 45 67" / "050…" / "50…" → "501234567".
  static String nationalDigits(String input) {
    final digits = input.replaceAll(RegExp(r'\D'), '');
    if (digits.startsWith('994')) return digits.substring(3);
    if (digits.startsWith('0')) return digits.substring(1);
    return digits;
  }
}
