import 'package:expense_tracker/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer(
    BuildContext context, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Image.asset(
              'assets/icons/wallet.png',
              width: 100,
              height: 100,
              alignment: Alignment.centerLeft,
            ),
            decoration: BoxDecoration(
              color: darkPrimaryColor,
            ),
          ),
          ListTile(
            title: Text('Category'),
            leading: Icon(Icons.category),
            onTap: () {
              Navigator.of(context).pushNamed("newtransaction");
            },
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            title: Text('Chart'),
            leading: Icon(Icons.pie_chart),
            onTap: () {
              Navigator.of(context).pushNamed("chart");
            },
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            title: Text('Reminder'),
            leading: Icon(Icons.notifications),
            onTap: () {
              Navigator.of(context).pushNamed("reminder");
            },
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
