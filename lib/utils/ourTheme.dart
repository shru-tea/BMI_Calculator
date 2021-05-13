import 'package:flutter/material.dart';

//making a theme class for reusability purposes
class OurTheme {
  Color _darkblack = Color(0xFF0A0E21);
  Color _lightblack = Color(0xFF0A0E21);
  Color _grey = Color(0xFF1D1E33);
  Color _hotpink = Color(0xFFEB1555);
  Color _inactive = Color(0xFF111328);
  Color _greyish = Color(0xFF8D8E98);

  ThemeData buildTheme() {
    return ThemeData(
        canvasColor: _lightblack,
        primaryColor: _darkblack,
        accentColor: _hotpink,
        cardColor: _grey,
        focusColor: _inactive,
        dividerColor: _greyish,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white, fontSize: 22.0),
          headline6: TextStyle(color: Color(0xFF8D8E98), fontSize: 18.0),
          headline2: TextStyle(
              color: Colors.white,
              fontSize: 100.0,
              fontWeight: FontWeight.bold),
          headline5: TextStyle(
              color: Color(0xFF24D876),
              fontSize: 22.0,
              fontWeight: FontWeight.bold),
          headline1: TextStyle(
              color: Colors.white, fontSize: 45.0, fontWeight: FontWeight.w900),
        ),
        iconTheme: IconThemeData(size: 80.0, color: Colors.white),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFF4C4F5E),
        ));
  }
}
