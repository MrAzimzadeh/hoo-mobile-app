import '../../../core/utils/formatters.dart';

/// Client-side checks that mirror the backend validators (FluentValidation in `Hoo.Application.Identity`).
/// The server stays the authority — its field errors are mapped onto the same inputs.
abstract final class AuthValidation {
  static final _email = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
  static const passwordMinLength = 8;
  static const passwordMaxLength = 128;
  static const nameMaxLength = 100;

  static bool isEmail(String value) => _email.hasMatch(value.trim());

  /// `PasswordPolicy.IsStrong`: 8–128 chars, at least one digit and one non-alphanumeric character.
  static bool isStrongPassword(String value) =>
      value.length >= passwordMinLength &&
      value.length <= passwordMaxLength &&
      value.contains(RegExp(r'\d')) &&
      value.contains(RegExp(r'[^\p{L}\p{N}]', unicode: true));

  /// 9 national digits (the `+994` prefix is fixed in the phone field).
  static bool isAzPhone(String value) {
    final digits = value.replaceAll(RegExp(r'\D'), '');
    final local = digits.startsWith('994')
        ? digits.substring(3)
        : digits.startsWith('0')
        ? digits.substring(1)
        : digits;
    return local.length == 9;
  }

  /// Sign-in identifier: an email as typed, or a phone normalized to the `+994…` wire format.
  static String? normalizeIdentifier(String raw) {
    final value = raw.trim();
    if (value.isEmpty) return null;
    if (value.contains('@')) return isEmail(value) ? value : null;
    if (RegExp(r'^[\d\s()+-]+$').hasMatch(value) && isAzPhone(value)) return HooFormat.phoneWire(value);
    return null;
  }
}
