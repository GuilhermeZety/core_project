import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Toasting{
  /// It shows a toast message on the screen.
  /// 
  /// Args:
  ///   message (String): The message you want to display
  ///   color (Color): The color of the toast.
  static void showToast(String message, Color color){
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: color.withOpacity(0.8),
      textColor: Colors.white,
      fontSize: 16.0
    );
  }
}