import 'package:flutter/material.dart';

class SnackBarServices {
  static void showErrorSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 2,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.up,
        content: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
