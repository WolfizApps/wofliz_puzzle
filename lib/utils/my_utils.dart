import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyUtils {
  static showToast(String message) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0XFF6D54B5),
      textColor: Colors.white,
      fontSize: 24.0,
    );
  }


}
