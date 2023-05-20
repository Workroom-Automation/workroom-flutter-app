import 'package:flutter/material.dart';

const mobileScreenSizeLimit = 600;

class Shared {
  Shared._();
  static void toast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
