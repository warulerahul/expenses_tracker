import 'package:expense_tracker/ui/shared/app_colors.dart';
import 'package:expense_tracker/ui/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkPrimaryColor,
        body: SafeArea(
            child: SplashScreen(
                seconds: 2,
                navigateAfterSeconds: HomeView(),
                title: new Text(
                  'Expense Tracker',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                image: new Image.asset(
                  'assets/icons/wallet.png',
                  height: 100,
                  width: 100,
                ),
                backgroundColor: darkPrimaryColor,
                loadingText: Text(
                  'Designed & Developed By - Rahul Warule',
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      fontStyle: FontStyle.normal, color: Colors.white),
                ),
                photoSize: 100.0,
                loaderColor: Colors.orange)));
  }
}
