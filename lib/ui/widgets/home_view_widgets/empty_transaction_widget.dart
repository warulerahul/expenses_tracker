import 'package:expense_tracker/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class EmptyTransactionsWidget extends StatelessWidget {
  const EmptyTransactionsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        UIHelper.verticalSpaceLarge(),
        Image.asset(
          'assets/icons/no-money.png',
          width: 120,
          height: 120,
        ),
        UIHelper.verticalSpaceMedium(),
        Text(
          'No transactions\nTap + to add one.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 18),
        ),
      ],
    );
  }
}
