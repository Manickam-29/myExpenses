import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myexpenses/common_components/common_calculation.dart';

class CustomFunctions {
  Future<String> selectedDate(BuildContext context) async {
    int firstDate = CommonCalculations().get100YearsAgo();

    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        lastDate: DateTime.now(),
        firstDate: DateTime(firstDate));

    return "${selected?.day}-${selected?.month}-${selected?.year}";
  }

  String formatToRupees(String value) {
    num amount = num.parse(value);
    final NumberFormat formatter = NumberFormat.currency(
      locale: 'en_IN',
      symbol: '₹',
      decimalDigits: 0,
    );
    return formatter.format(amount);
  }
}
