import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastM {
  static show(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey[700],
        timeInSecForIosWeb: 5);
  }

  static showCenter(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.grey[700],
        timeInSecForIosWeb: 5);
  }
}
