import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Toasting{
  /// It shows a toast message on the screen.
  /// 
  /// Args:
  ///   message (String): The message you want to display
  ///   color (Color): The color of the toast.
  static void showToast(BuildContext context, String message, Color color){
    FToast ftoast = FToast().init(context);
    ftoast.removeQueuedCustomToasts();
    ftoast.showToast(
      gravity: ToastGravity.TOP, 
      toastDuration: Duration(seconds: 60),
      child: Container(
        padding: EdgeInsets.only(left: 20), 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color.withOpacity(0.8), 
        ),
        child: Row(
          children: [
            Expanded(child: Text(message, style: TextStyle(color: Colors.white),)),
            IconButton(icon: Icon(Icons.close, color: Colors.white,), onPressed: () => ftoast.removeCustomToast(),)
          ],
        ))
    );
  }
}