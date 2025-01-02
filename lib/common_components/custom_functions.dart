import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myexpenses/common_components/common_calculation.dart';
import 'package:myexpenses/common_components/common_variables.dart';

class CustomFunctions {
  Future<String> selectedDate(BuildContext context) async {
    int firstDate = CommonCalculations().get100YearsAgo();

    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),
      firstDate: DateTime(firstDate),
    );

    if (selectedDate != null) {
      DateFormat format = DateFormat('dd-MM-yyyy');
      return format.format(selectedDate); // Formats the selected date directly
    } else {
      return ""; // Handle null case if the user cancels the date picker
    }
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

  querySnapshotToList(QuerySnapshot querySnapshot) {
    List<Map<String, dynamic>> data = querySnapshot.docs.map((doc) {
      return doc.data() as Map<String, dynamic>;
    }).toList();

    return data;
  }

  String getCurrentDate() {
    DateTime currentDate = DateTime.now();

    DateFormat format = DateFormat('dd-MM-yyyy');
    return format.format(currentDate); // Formats the selected date directly
  }

  IconData getExpenseIcon(String expenseType) {
    int index = expenseTypeString.indexOf(expenseType);
    return expenseTypeIcons[index];
  }

  String addDate(String dateStr) {
    final dateFormat = DateFormat('dd-MM-yyyy');
    DateTime date = dateFormat.parse(dateStr);
    DateTime newDate = date.add(Duration(days: 1));
    DateTime today = DateTime.now();
    DateTime todayWithoutTime = DateTime(today.year, today.month, today.day);
    if (newDate.isAfter(todayWithoutTime)) {
      return dateFormat.format(date);
    } else {
      return dateFormat.format(newDate);
    }
  }

  String subDate(String dateStr) {
    final dateFormat = DateFormat('dd-MM-yyyy');
    DateTime date = dateFormat.parse(dateStr);
    date = date.subtract(Duration(days: 1));
    return dateFormat.format(date);
  }
}
