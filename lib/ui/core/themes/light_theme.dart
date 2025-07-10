import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';

final lightTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  return ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,

    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: blackColor,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: primaryColor),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      border: InputBorder.none,
    ),

    textTheme: TextTheme(
      //headline* → Section titles , App bar
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),

      //title* → button text
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),

      // sub tilte
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: gray1,
      ),

      //label* → Buttons, captions, tags
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: blackColor,
      ),
    ),
  );
}
