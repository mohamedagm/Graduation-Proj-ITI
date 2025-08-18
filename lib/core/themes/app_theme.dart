import 'package:flutter/material.dart';
import 'package:iti_project/core/constants/app_colors.dart';
import 'package:iti_project/core/themes/app_text_styles.dart';

// text✅ - appBar✅ - elebatedButton✅ - textformfield✅ - textButton✅
// iconButton✅ - ✅bottomAppBar: so sorry i used convex, so see U soon
class AppTheme {
  /// Light Theme
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.light(
      onSurface: AppColors.textDark,
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: Colors.blueAccent,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      titleTextStyle: AppTextStyles.bodyLarge,
      iconTheme: IconThemeData(color: AppColors.primary),
      actionsIconTheme: IconThemeData(color: AppColors.primary),
      actionsPadding: const EdgeInsets.only(right: 16.0),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(AppColors.primary),
        padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
        textStyle: WidgetStateProperty.all(AppTextStyles.bodyLarge),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size(125, 55)),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 16),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        ),
        elevation: WidgetStateProperty.resolveWith<double>((states) {
          if (states.contains(WidgetState.pressed)) return 2;
          return 4;
        }),
        backgroundColor: WidgetStateProperty.all(AppColors.primary),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        overlayColor: WidgetStateProperty.all(const Color(0xA62195F3)),
        textStyle: WidgetStateProperty.all(AppTextStyles.titleLarge),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(color: AppColors.hint),
      prefixIconColor: AppColors.hint,
      suffixIconColor: AppColors.hint,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide(color: AppColors.primary, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide(color: AppColors.backgroundLight),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),
      ),
    ),

    bottomAppBarTheme: const BottomAppBarTheme(
      elevation: 8,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: AutomaticNotchedShape(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
      ),
    ),

    textTheme: AppTextStyles.textTheme,
  );

  /// Dark Theme
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.dark(
      onSurface: Colors.white,
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: Colors.blueAccent,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.backgroundDark,
      foregroundColor: Colors.white,
      titleTextStyle: AppTextStyles.bodyLarge,
      iconTheme: IconThemeData(color: AppColors.primary),
      actionsIconTheme: IconThemeData(color: AppColors.primary),
      actionsPadding: const EdgeInsets.only(right: 16.0),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(AppColors.primary),
        padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
        textStyle: WidgetStateProperty.all(AppTextStyles.bodyLarge),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size(125, 55)),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 16),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        ),
        elevation: WidgetStateProperty.resolveWith<double>((states) {
          if (states.contains(WidgetState.pressed)) return 2;
          return 4;
        }),
        backgroundColor: WidgetStateProperty.all(AppColors.primary),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        overlayColor: WidgetStateProperty.all(const Color(0xA62195F3)),
        textStyle: WidgetStateProperty.all(AppTextStyles.titleLarge),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(color: AppColors.hint),
      prefixIconColor: AppColors.hint,
      suffixIconColor: AppColors.hint,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide(color: AppColors.primary, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide(color: AppColors.backgroundLight),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),
      ),
    ),

    bottomAppBarTheme: const BottomAppBarTheme(
      elevation: 8,
      color: Color(0xff111318),
      surfaceTintColor: Color(0xff111318),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: AutomaticNotchedShape(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
      ),
    ),

    textTheme: AppTextStyles.textTheme,
  );
}
