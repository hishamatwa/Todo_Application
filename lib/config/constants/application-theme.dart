import 'package:flutter/material.dart';

class apptheme{
  static const Color primarycolor=Color(0XFF5D9CEC);
  static ThemeData lighttheme =ThemeData(
    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.white,
      padding: EdgeInsets.zero,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primarycolor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        side: BorderSide(
          color: Colors.white,
          width: 5
        )
      )
    ),
    primaryColor: primarycolor,
    scaffoldBackgroundColor: Color(0XFFDFECDB),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      showSelectedLabels: false,
      selectedItemColor: primarycolor,
      selectedIconTheme: IconThemeData(
          color: primarycolor,
        size: 38,
      ),
      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(
        color: Color(0XFFC8C9CB),
        size:28,
      ),
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: "popines",
        fontSize: 12,
        color: Colors.white
      ),
        bodyMedium: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: "popines",
            fontSize: 18,
            color: Colors.white
            ),
    bodyLarge: TextStyle(
    fontWeight: FontWeight.bold,
        fontFamily: "popines",
        fontSize: 22,
        color: Colors.white
    ),
      titleMedium: TextStyle(
    fontWeight: FontWeight.w700,
        fontFamily: "popines",
        fontSize: 15,
        color: Colors.white
    )


    )
  );
  static ThemeData darktheme =ThemeData(
    scaffoldBackgroundColor: Color(0XFF060E1E),
    bottomAppBarTheme: BottomAppBarTheme(
      color: Color(0XFF060E1E),
      padding: EdgeInsets.zero,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(
                color: Color(0XFF060E1E),
                width: 5
            )
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0XFF141922),
      showSelectedLabels: false,
      selectedItemColor: primarycolor,
      selectedIconTheme: IconThemeData(
        color: primarycolor,
        size: 38,
      ),
      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(
        color: Color(0XFFC8C9CB),
        size:28,
      ),

    ),
      textTheme: const TextTheme(
          bodySmall: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: "popines",
              fontSize: 12,
              color: Colors.white
          ),
          bodyMedium: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: "popines",
              fontSize: 18,
              color: Colors.white
          ),
          bodyLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "popines",
              fontSize: 22,
              color: Colors.white
          ),
          titleMedium: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: "popines",
              fontSize: 15,
              color: Colors.white
          )


      )
  );

}