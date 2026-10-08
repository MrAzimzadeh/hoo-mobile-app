import 'package:equatable/equatable.dart';

import '../../../shared/domain/models.dart';

/// Field of the address form (also the key used for server field errors).
enum AddressField { label, city, district, street, building, apartment, note }

/// Why a field is invalid. The page maps these to localized messages.
enum AddressFieldError { required, tooLong }

/// Editable address (`AddressRequest`) with the server's validation rules (`AddressRequestValidator` +
/// `DeliveryAddressValidator`) mirrored client-side so most mistakes are caught before a round trip.
///
/// The form has a separate "building" field for clarity, but `DeliveryAddress` has none: it is folded into
/// `street` as "Street, Building" on save and split back out on edit.
// TODO(backend): DeliveryAddress has no Building field — building is stored inside Street.
class AddressDraft extends Equatable {
  const AddressDraft({
    this.label = '',
    this.city = '',
    this.district = '',
    this.street = '',
    this.building = '',
    this.apartment = '',
    this.note = '',
    this.isDefault = false,
  });

  factory AddressDraft.fromSaved(SavedAddress saved) {
    final (street, building) = splitStreet(saved.address.street);
    return AddressDraft(
      label: saved.label,
      city: saved.address.city,
      district: saved.address.district ?? '',
      street: street,
      building: building,
      apartment: saved.address.apartment ?? '',
      note: saved.address.courierNote ?? '',
      isDefault: saved.isDefault,
    );
  }

  final String label;
  final String city;
  final String district;
  final String street;
  final String building;
  final String apartment;
  final String note;
  final bool isDefault;

  static const maxLength = {
    AddressField.label: 40,
    AddressField.city: 60,
    AddressField.district: 60,
    AddressField.street: 200,
    AddressField.building: 20,
    AddressField.apartment: 60,
    AddressField.note: 300,
  };

  static const requiredFields = {AddressField.label, AddressField.city, AddressField.street};

  String value(AddressField f) => switch (f) {
    AddressField.label => label,
    AddressField.city => city,
    AddressField.district => district,
    AddressField.street => street,
    AddressField.building => building,
    AddressField.apartment => apartment,
    AddressField.note => note,
  };

  AddressDraft copyWithField(AddressField f, String v) => AddressDraft(
    label: f == AddressField.label ? v : label,
    city: f == AddressField.city ? v : city,
    district: f == AddressField.district ? v : district,
    street: f == AddressField.street ? v : street,
    building: f == AddressField.building ? v : building,
    apartment: f == AddressField.apartment ? v : apartment,
    note: f == AddressField.note ? v : note,
    isDefault: isDefault,
  );

  AddressDraft copyWithDefault(bool v) =>
      AddressDraft(label: label, city: city, district: district, street: street, building: building, apartment: apartment, note: note, isDefault: v);

  /// Field → error, empty when the draft can be submitted.
  Map<AddressField, AddressFieldError> validate() {
    final errors = <AddressField, AddressFieldError>{};
    for (final f in AddressField.values) {
      final v = value(f).trim();
      if (requiredFields.contains(f) && v.isEmpty) {
        errors[f] = AddressFieldError.required;
      } else if (v.length > maxLength[f]!) {
        errors[f] = AddressFieldError.tooLong;
      }
    }
    // The combined street must still fit the server limit.
    if (!errors.containsKey(AddressField.street) && composedStreet.length > maxLength[AddressField.street]!) {
      errors[AddressField.street] = AddressFieldError.tooLong;
    }
    return errors;
  }

  bool get isValid => validate().isEmpty;

  String get composedStreet {
    final s = street.trim(), b = building.trim();
    if (b.isEmpty) return s;
    if (s.isEmpty) return b;
    return '$s, $b';
  }

  /// `AddressRequest` body.
  Map<String, dynamic> toRequest() => {
    'label': label.trim(),
    'address': {
      'city': city.trim(),
      'district': _nullIfEmpty(district),
      'street': composedStreet,
      'apartment': _nullIfEmpty(apartment),
      'courierNote': _nullIfEmpty(note),
    },
    'isDefault': isDefault,
  };

  /// "Nizami küç., 10" → ("Nizami küç.", "10"). Only a short trailing part containing a digit counts as the
  /// building, so street names with commas are left intact.
  static (String street, String building) splitStreet(String raw) {
    final i = raw.lastIndexOf(',');
    if (i <= 0) return (raw.trim(), '');
    final tail = raw.substring(i + 1).trim();
    if (tail.isEmpty || tail.length > maxLength[AddressField.building]! || !tail.contains(RegExp(r'\d'))) return (raw.trim(), '');
    return (raw.substring(0, i).trim(), tail);
  }

  static String? _nullIfEmpty(String v) => v.trim().isEmpty ? null : v.trim();

  @override
  List<Object?> get props => [label, city, district, street, building, apartment, note, isDefault];
}
