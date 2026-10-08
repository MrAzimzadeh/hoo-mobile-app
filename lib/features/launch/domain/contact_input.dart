import '../../../core/utils/formatters.dart';
import 'launch_models.dart';

/// Client-side validation outcome for a sign-up field (mapped to l10n by the page).
enum ContactError { required, invalidEmail, invalidPhone }

/// Parses the single "email or phone" field of the waitlist form. The backend re-validates; this only catches
/// obvious mistakes before a round-trip.
abstract final class ContactInput {
  static final _email = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
  static final _phoneChars = RegExp(r'^[\d\s+()\-]+$');

  static bool isEmail(String value) => _email.hasMatch(value.trim());

  /// Either a contact or the reason it is not one.
  static ({WaitlistContact? contact, ContactError? error}) parse(String raw) {
    final value = raw.trim();
    if (value.isEmpty) return (contact: null, error: ContactError.required);
    if (value.contains('@') || !_phoneChars.hasMatch(value)) {
      return isEmail(value) ? (contact: WaitlistContact.email(value), error: null) : (contact: null, error: ContactError.invalidEmail);
    }
    final digits = value.replaceAll(RegExp(r'\D'), '');
    final local = digits.startsWith('994')
        ? digits.substring(3)
        : digits.startsWith('0')
        ? digits.substring(1)
        : digits;
    if (local.length != 9) return (contact: null, error: ContactError.invalidPhone);
    return (contact: WaitlistContact.phone(HooFormat.phoneWire(local)), error: null);
  }

  /// Newsletter: email only.
  static ContactError? validateEmail(String raw) {
    final value = raw.trim();
    if (value.isEmpty) return ContactError.required;
    return isEmail(value) ? null : ContactError.invalidEmail;
  }
}
