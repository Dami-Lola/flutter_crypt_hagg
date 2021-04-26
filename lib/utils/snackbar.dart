import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context, {
  String message = 'An error occured',
  int duration = 3,
  SnackBarAction action,
}) {
  Scaffold.of(context).showSnackBar(SnackBar(
    backgroundColor: Color(0xFF212934),
    content: Text(
      message,
      style: const TextStyle(
        color: Color(0xFFFFFFFF),
        fontStyle: FontStyle.normal,
        fontSize: 14,
      ),
    ),
    duration: Duration(seconds: duration),
    action: action
  ));
}
