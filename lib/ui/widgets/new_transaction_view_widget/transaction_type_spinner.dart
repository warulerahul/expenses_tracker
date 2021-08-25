import 'package:flutter/material.dart';

class TransactionTypeSpinner extends StatelessWidget {
  final selectedItem;
  final Function changedSelectedItem;
  const TransactionTypeSpinner(this.selectedItem, this.changedSelectedItem);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: selectedItem,
        dropdownColor: Colors.orangeAccent.shade400,
        iconEnabledColor: Colors.white,
        items: [
          DropdownMenuItem(
            child: Text(
              "Income",
              style: TextStyle(color: Colors.white),
            ),
            value: 1,
          ),
          DropdownMenuItem(
            child: Text(
              "Expense",
              style: TextStyle(color: Colors.white),
            ),
            value: 2,
          ),
        ],
        onChanged: (value) {
          changedSelectedItem(value);
        });
  }
}
