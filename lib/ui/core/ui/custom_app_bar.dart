import 'package:flutter/material.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';

AppBar CustomAppBar(VoidCallback onPressed) {
  return AppBar(
    backgroundColor: backgroundColor,
    leading: IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.arrow_back_ios_new),
    ),
  );
}
