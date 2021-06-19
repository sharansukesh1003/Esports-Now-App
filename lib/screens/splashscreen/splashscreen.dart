import 'dart:async';
import 'package:flutter/material.dart';
import 'package:esports_now/constants/constants.dart';
import 'package:page_transition/page_transition.dart';
import 'package:esports_now/screens2/parentscreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(
          seconds: 1,
        ), () {
      Navigator.pushReplacement(
        context,
        PageTransition(
            child: MyBottomBarDemo(), type: PageTransitionType.leftToRight),
      );
    });
    super.initState();
  }

  ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.primaryColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ESPORTS',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  fontStyle: FontStyle.italic,
                  color: constantColors.whiteColor),
            ),
            Text(
              'NOW',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  fontStyle: FontStyle.italic,
                  color: constantColors.accentColor),
            )
          ],
        ),
      ),
    );
  }
}
