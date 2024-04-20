import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeControl {
  static const Color primarylightColor =Color(0xFFB7935F);
  static const Color primarydarkColor =Color(0xFF141A2E);
  static const String elmessiri ="ElMessiri";
  static ThemeData lightTheme = ThemeData(
      primaryColor: primarylightColor,
      textTheme: TextTheme() ,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          size: 30,
            color: Colors.black
        ),
        actionsIconTheme: IconThemeData(
            color: Colors.black
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontFamily: "ElMessiri",
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,

        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: primarylightColor,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(
            color: Colors.black,
            size: 50,
          ),
          showUnselectedLabels: false,

          selectedLabelStyle: TextStyle(
            fontFamily: "ElMessiri",
            fontSize: 18,
            ),
          selectedItemColor: Colors.black,
          unselectedIconTheme: IconThemeData(
          color: Colors.white,
          size: 45,
          )
      ),


  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: primarydarkColor,
    textTheme: TextTheme() ,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
          size: 30,
          color: Colors.white
      ),
      actionsIconTheme: IconThemeData(
          color: Colors.white
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: "ElMessiri",
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
          color: Colors.white

      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primarydarkColor,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(
          color: Color(0xffFACC1D),
          size: 50,
        ),
        showUnselectedLabels: false,

        selectedLabelStyle: TextStyle(
          fontFamily: "ElMessiri",
          fontSize: 18,
        ),
        selectedItemColor: Color(0xffFACC1D),
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
          size: 45,
        )
    ),


  );
}
