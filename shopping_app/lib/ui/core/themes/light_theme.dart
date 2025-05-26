import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';


/**
 * display* → Big, bold titles (e.g., app title)

headline* → Section titles

title* → Smaller titles or subtitles

body* → Main content text

label* → Buttons, captions, tags
 */


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
      titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w500 , color: blackColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
    ),


    
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.normal, color: blackColor),
      displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.normal, color: blackColor),
      displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.normal, color: blackColor),

      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.normal, color: blackColor),
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.normal, color: blackColor),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.normal, color: blackColor),

      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: blackColor),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: blackColor),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: blackColor),

      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: blackColor),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: blackColor),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: blackColor),

      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: blackColor),
      labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: blackColor),
      labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: blackColor),
    ),
  );
}
