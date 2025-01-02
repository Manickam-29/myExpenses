import 'package:flutter/services.dart';

class CustomInputFormatter {
  TextInputFormatter notAllowSpace() {
    return FilteringTextInputFormatter.deny(RegExp(r'\s'));
  }

  TextInputFormatter notAllSpecialChar() {
    return FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]'));
  }

  TextInputFormatter allowOnlyAlphabets() {
    return FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'));
  }

  TextInputFormatter allowOnlyDigits() {
    return FilteringTextInputFormatter.digitsOnly;
  }

  TextInputFormatter allowOnlyLength(int length) {
    return LengthLimitingTextInputFormatter(length);
  }
}
