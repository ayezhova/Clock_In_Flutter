import 'package:flutter/material.dart';
import 'package:workday/pages/home.dart';
import 'package:workday/pages/loading.dart';
import 'package:workday/pages/timeLogPage.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.redAccent,
      scaffoldBackgroundColor: Color(0xFF3B336C),
      accentColor: Colors.indigo,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.normal,
        buttonColor: Colors.redAccent,
      ),
      textTheme: TextTheme(
        bodyText2: TextStyle(
          color: Colors.white,
        ),
        bodyText1: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => LoadingScreen(),
      '/home': (context) => Home(),
    },
  ));
}
