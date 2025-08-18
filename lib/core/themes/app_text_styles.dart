import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static final displayLarge = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle displayMedium = TextStyle(
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
  static final TextTheme textTheme = TextTheme(
    displayLarge: AppTextStyles.displayLarge, // 35, bold
    displayMedium: AppTextStyles.displayMedium, // 30, w500
    titleLarge: AppTextStyles.titleLarge, // 20, w400
    titleMedium: AppTextStyles.titleMedium, // 18, w500
    bodyLarge: AppTextStyles.bodyLarge, // 16, w800
    bodyMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
    ), //Just for InputD
    bodySmall: AppTextStyles.bodySmall, // 14, w500
    labelSmall: AppTextStyles.labelSmall, // 12, w400
  );
}
