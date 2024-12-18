import 'package:flutter/material.dart';

class ThemeApp {
  static const Color Primarycolor = Color(0xFF121312);
  static const Color lightgray = Color(0xFFC6C6C6);
  static const Color gold = Color(0xFFFFBB3B);
  static const Color black = Color(0xFF1A1A1A);
  static const Color gray = Color(0xFF514F4F);

  static ThemeData appTheme = ThemeData(
      primaryColor: Primarycolor,
      scaffoldBackgroundColor: Primarycolor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: black,
        selectedItemColor: gold,
        unselectedItemColor: lightgray,
      ),
      textTheme: TextTheme(
          titleMedium: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: lightgray,
          )));
}
