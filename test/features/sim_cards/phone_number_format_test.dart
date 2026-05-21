import 'package:cardfan/features/sim_cards/phone_number_format.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('formats valid E.164 phone numbers for display', () {
    expect(formatPhoneNumberForDisplay('+886912345678'), '+886 912 345 678');
  });

  test('falls back to compact phone number when parsing fails', () {
    expect(formatPhoneNumberForDisplay('138 0013-8000'), '13800138000');
  });
}
