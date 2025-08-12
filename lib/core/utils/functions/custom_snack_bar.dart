import 'package:flutter/material.dart';

void customSnackBar(
  BuildContext context,
  String text, {
  Color backgroundColor = Colors.black,
  double borderRadius = 12,
}) {
  final snackBar = SnackBar(
    content: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    ),
    backgroundColor: backgroundColor,
    duration: Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
