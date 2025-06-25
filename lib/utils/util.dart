import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';

String? emailValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'email is required';
  }
  var regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (!regExp.hasMatch(value)) {
    return 'This email is not valid';
  }
  return null;
}

String getImagePath(String image) {
  return 'lib/config/assets/images/$image';
}
String getIconPath(String image) {
  return 'lib/config/assets/icons/$image';
}

String? passwordValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'password is required';
  }
  if (value.length < 8) {
    return 'password must be grater then 8 chars';
  }
  return null;
}

void showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    backgroundColor: primaryColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
