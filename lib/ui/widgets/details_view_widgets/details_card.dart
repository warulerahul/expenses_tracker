import 'package:expense_tracker/core/database/moor_database.dart';
import 'package:expense_tracker/core/viewmodels/details_model.dart';
import 'package:expense_tracker/ui/shared/ui_helpers.dart';
import 'package:expense_tracker/ui/widgets/details_view_widgets/details_table.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  final Transaction transaction;
  final DetailsModel model;
  DetailsCard({this.transaction, this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blueAccent.withOpacity(.1),
                  child: model.getIconForCategory(
                      transaction.categoryindex, transaction.type)),
              title: Text(
                "\t\t\t" +
                    model.getCategoryIconName(
                        transaction.categoryindex, transaction.type),
                style: TextStyle(fontSize: 30),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            UIHelper.verticalSpaceSmall(),
            DetailsTable(transaction: transaction),
          ],
        ),
      ),
    );
  }
}
