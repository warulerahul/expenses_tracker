import 'package:expense_tracker/locator.dart';
import 'package:expense_tracker/ui/router.dart';
import 'package:expense_tracker/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: darkPrimaryColor,
        accentColor: accentColor,
      ),
      initialRoute: '/',
      onGenerateRoute: Router1.generateRoute,
    );
  }
}
