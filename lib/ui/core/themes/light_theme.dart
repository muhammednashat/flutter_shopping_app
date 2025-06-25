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
      titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w500 , color: blackColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
    ),

     inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      border: InputBorder.none,

     ),
    
    textTheme: TextTheme(



//headline* → Section titles , App bar
      headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: blackColor),
      
      
      headlineMedium:TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: blackColor), 

//title* → Smaller titles or subtitles
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: blackColor),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: gray1),

//body* → Main content text
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: blackColor),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: blackColor),

//label* → Buttons, captions, tags
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: blackColor),
    ),
  );
}
