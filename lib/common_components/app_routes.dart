import 'package:flutter/material.dart';
import 'package:myexpenses/screens/add_new_expense.dart';
import 'package:myexpenses/screens/home_screen.dart';
import 'package:myexpenses/screens/loading_screen.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return {
    '/loading': (context) => const LoadingScreen(),
    '/home': (context) => const HomeScreen(),
    '/add' : (context) => const AddNewExpense(),
  };
}
