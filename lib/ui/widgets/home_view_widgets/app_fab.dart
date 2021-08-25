import 'package:expense_tracker/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';

class AppFAB extends StatelessWidget {
  final Function closeMonthPicker;

  const AppFAB(this.closeMonthPicker);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        closeMonthPicker();
        Navigator.of(context).pushNamed("newtransaction");
      },
      child: Icon(Icons.add, color: Colors.white),
      backgroundColor: darkPrimaryColor,
    );
  }
}
