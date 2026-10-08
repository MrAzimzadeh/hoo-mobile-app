import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

/// Locale-aware formatting. Money is AZN with two decimals: `12,50 ₼` for az/ru/tr, `₼12.50` for en.
/// Values are always the server's — the client formats, it never computes totals.
abstract final class HooFormat {
  static String money(BuildContext context, num amount) => moneyFor(Localizations.localeOf(context).languageCode, amount);

  static String moneyFor(String lang, num amount) {
    if (lang == 'en') {
      return NumberFormat.currency(locale: 'en', symbol: '₼', decimalDigits: 2).format(amount);
    }
    final n = NumberFormat.decimalPatternDigits(locale: _numberLocale(lang), decimalDigits: 2).format(amount);
    return '$n ₼';
  }

  /// Signed amount for breakdown rows (`−5,00 ₼`, `+12,00 ₼`).
  static String signedMoney(BuildContext context, num amount) {
    final abs = money(context, amount.abs());
    if (amount < 0) return '−$abs';
    return '+$abs';
  }

  static String date(BuildContext context, DateTime d) => DateFormat.yMMMd(_dateLocale(context)).format(d.toLocal());
  static String dayMonth(BuildContext context, DateTime d) => DateFormat.MMMd(_dateLocale(context)).format(d.toLocal());
  static String weekdayDayMonth(BuildContext context, DateTime d) => DateFormat.MMMEd(_dateLocale(context)).format(d.toLocal());
  static String dateTime(BuildContext context, DateTime d) => DateFormat.yMMMd(_dateLocale(context)).add_Hm().format(d.toLocal());
  static String time(BuildContext context, DateTime d) => DateFormat.Hm(_dateLocale(context)).format(d.toLocal());

  /// "HH:mm:ss" (TimeOnly) → "HH:mm".
  static String timeOnly(String hhmmss) => hhmmss.length >= 5 ? hhmmss.substring(0, 5) : hhmmss;

  /// Date range for delivery estimates: "12–14 Oct".
  static String dateRange(BuildContext context, DateTime from, DateTime to) {
    if (from.year == to.year && from.month == to.month) {
      if (from.day == to.day) return dayMonth(context, from);
      return '${from.day}–${dayMonth(context, to)}';
    }
    return '${dayMonth(context, from)} – ${dayMonth(context, to)}';
  }

  static String relative(BuildContext context, DateTime d) {
    final lang = Localizations.localeOf(context).languageCode;
    final diff = DateTime.now().difference(d.toLocal());
    if (diff.inMinutes < 1) return _now[lang] ?? 'now';
    if (diff.inHours < 1) return _ago(lang, diff.inMinutes, 'm');
    if (diff.inDays < 1) return _ago(lang, diff.inHours, 'h');
    if (diff.inDays < 7) return _ago(lang, diff.inDays, 'd');
    return date(context, d);
  }

  /// "+994 50 123 45 67" from any 9/12-digit AZ number.
  static String phone(String raw) {
    final digits = raw.replaceAll(RegExp(r'\D'), '');
    final local = digits.startsWith('994') ? digits.substring(3) : digits;
    if (local.length != 9) return raw;
    return '+994 ${local.substring(0, 2)} ${local.substring(2, 5)} ${local.substring(5, 7)} ${local.substring(7)}';
  }

  /// "+994501234567" — the wire format the backend validates (AzPhone).
  static String phoneWire(String input) {
    final digits = input.replaceAll(RegExp(r'\D'), '');
    final local = digits.startsWith('994') ? digits.substring(3) : digits.startsWith('0') ? digits.substring(1) : digits;
    return '+994$local';
  }

  static String countdown(Duration d) {
    final s = d.inSeconds.clamp(0, 359999);
    final m = (s ~/ 60).toString().padLeft(2, '0');
    final r = (s % 60).toString().padLeft(2, '0');
    return '$m:$r';
  }

  static String _numberLocale(String lang) => switch (lang) { 'az' => 'az', 'ru' => 'ru', 'tr' => 'tr', _ => 'en' };
  static String _dateLocale(BuildContext context) => _numberLocale(Localizations.localeOf(context).languageCode);

  static const _now = {'az': 'indicə', 'ru': 'только что', 'en': 'just now', 'tr': 'şimdi'};
  static String _ago(String lang, int n, String unit) {
    const u = {
      'az': {'m': 'dəq', 'h': 'saat', 'd': 'gün'},
      'ru': {'m': 'мин', 'h': 'ч', 'd': 'дн'},
      'tr': {'m': 'dk', 'h': 'sa', 'd': 'gün'},
      'en': {'m': 'm', 'h': 'h', 'd': 'd'},
    };
    final word = (u[lang] ?? u['en']!)[unit]!;
    return switch (lang) {
      'az' => '$n $word əvvəl',
      'ru' => '$n $word назад',
      'tr' => '$n $word önce',
      _ => '$n$word ago',
    };
  }
}
