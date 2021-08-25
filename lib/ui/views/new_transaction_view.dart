import 'package:expense_tracker/core/viewmodels/new_transcation_model.dart';
import 'package:expense_tracker/ui/shared/app_colors.dart';
import 'package:expense_tracker/ui/shared/ui_helpers.dart';
import 'package:expense_tracker/ui/views/base_view.dart';
import 'package:expense_tracker/ui/widgets/new_transaction_view_widget/transaction_type_spinner.dart';
import 'package:flutter/material.dart';

class NewTransactionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<NewTransactionModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: TransactionTypeSpinner(
              model.selectedCategory, model.changeSelectedItem),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1.2,
              children: model
                  .loadCategoriesIcons()
                  .map((e) => Card(
                      elevation: 4,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("inserttransaction",
                              arguments: [e, model.selectedCategory]);
                        },
                        child: Container(
                          padding: EdgeInsets.all(4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(e.name),
                              UIHelper.verticalSpaceSmall(),
                              CircleAvatar(
                                radius: 28,
                                backgroundColor: lightPrimaryColor,
                                child: Center(
                                  child: Icon(
                                    e.icon,
                                    size: 18,
                                    color: accentColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
