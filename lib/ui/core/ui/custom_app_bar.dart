import 'package:flutter/material.dart';


AppBar CustomAppBar(String title , VoidCallback onPressed) {
  return AppBar(
    title: Text(title),
    leading: IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.arrow_back_ios_new),
    ),
  );
}
