import 'package:phone_numbers_parser/phone_numbers_parser.dart';

String formatPhoneNumberForDisplay(String value) {
  final compact = compactPhoneNumber(value);
  if (compact.isEmpty || !compact.startsWith('+')) {
    return compact;
  }

  try {
    final phoneNumber = PhoneNumber.parse(compact);
    final formattedNsn = phoneNumber.formatNsn(format: NsnFormat.international);
    if (formattedNsn.isEmpty) {
      return compact;
    }
    return '+${phoneNumber.countryCode} $formattedNsn';
  } on PhoneNumberException {
    return compact;
  }
}

String compactPhoneNumber(String value) {
  return value.trim().replaceAll(' ', '').replaceAll('-', '');
}

String? normalizePhoneNumberToE164(String value) {
  final trimmed = value.trim();
  if (trimmed.isEmpty) {
    return null;
  }

  try {
    final phoneNumber = PhoneNumber.parse(trimmed);
    return phoneNumber.isValid() ? phoneNumber.international : null;
  } on PhoneNumberException {
    return null;
  }
}
