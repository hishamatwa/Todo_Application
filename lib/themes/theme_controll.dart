

import 'package:flutter/material.dart';
import 'package:todo_app/fonts/fonts.dart';

class ThemeController{
   static Color primaryColor = const Color(0xFF5D9CEC);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme:  AppBarTheme(
            toolbarHeight: 100,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: Fontss.Poppins,
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(
            color: Colors.white)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(
            size: 30,
            color: primaryColor
          ),
            unselectedIconTheme: const IconThemeData(
                size: 30,

            )
        )
  );
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          toolbarHeight: 100,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: Fontss.Poppins,
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(
              color: Colors.white)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(
              size: 30,
              color: primaryColor
          ),
          unselectedIconTheme: const IconThemeData(
            size: 30,
            color: Colors.white
          )
      )
  );
}