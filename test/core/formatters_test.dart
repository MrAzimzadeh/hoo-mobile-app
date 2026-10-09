import 'package:flutter_test/flutter_test.dart';
import 'package:hoo/core/utils/formatters.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  setUpAll(() => initializeDateFormatting());

  test('money: comma decimals and trailing ₼ for az/ru/tr, leading ₼ for en', () {
    expect(HooFormat.moneyFor('az', 12.5), '12,50 ₼');
    expect(HooFormat.moneyFor('tr', 12.5), '12,50 ₼');
    expect(HooFormat.moneyFor('ru', 12.5).replaceAll(' ', ' '), '12,50 ₼');
    expect(HooFormat.moneyFor('en', 12.5), '₼12.50');
  });

  test('phones: display and wire formats', () {
    expect(HooFormat.phone('+994501234567'), '+994 50 123 45 67');
    expect(HooFormat.phoneWire('50 123 45 67'), '+994501234567');
    expect(HooFormat.phoneWire('0501234567'), '+994501234567');
  });

  test('countdown and TimeOnly', () {
    expect(HooFormat.countdown(const Duration(seconds: 75)), '01:15');
    expect(HooFormat.timeOnly('14:30:00'), '14:30');
  });
}
