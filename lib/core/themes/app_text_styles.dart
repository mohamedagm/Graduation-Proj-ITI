import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static final headline1 = TextStyle(fontSize: 35, fontWeight: FontWeight.bold);
  static final TextStyle headline2 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w500,
  );
  static final titleLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle titleMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
  );
  static final TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle labelSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );
}
