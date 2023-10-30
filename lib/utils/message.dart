import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Message {
  showMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 10.0);
  }
}
