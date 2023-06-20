import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';

class Utils {
  static toastMsg(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.amber,
        gravity: ToastGravity.BOTTOM_LEFT);
  }

  static void flushBarError(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          backgroundColor: Colors.red,
          dismissDirection: FlushbarDismissDirection.VERTICAL,
          duration: const Duration(seconds: 2),
        )..show(context));
  }
}
