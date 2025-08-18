import 'package:flutter/material.dart';
import 'package:iti_project/core/constants/app_colors.dart';
import 'package:iti_project/core/themes/app_text_styles.dart';

// text✅ - appBar✅ - elebatedButton✅ - textformfield - bottomAppBar
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
    // AppBar
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
    // ElevatedButton
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
    // TextFormField (InputDecorationTheme)
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: Colors.white,
      hintStyle: const TextStyle(color: AppColors.hint),
      labelStyle: const TextStyle(
        color: AppColors.hint,
        fontWeight: FontWeight.w600,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      prefixIconColor: AppColors.hint,
      suffixIconColor: AppColors.hint,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.backgroundLight),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.backgroundLight.withOpacity(0.6),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.6),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 1.6),
      ),
      helperStyle: const TextStyle(color: AppColors.textDark, fontSize: 12),
      errorStyle: const TextStyle(
        color: Colors.red,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    ),

    textTheme: AppTextStyles.textTheme,

    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),
      ),
    ),
    // BottomAppBar
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
  );

  /// Dark Theme
  static final ThemeData darkThemes = ThemeData(
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
      isDense: true,
      filled: true,
      fillColor: const Color(0xff111318),
      hintStyle: TextStyle(color: AppColors.hint.withOpacity(0.9)),
      labelStyle: const TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.w600,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      prefixIconColor: AppColors.hint,
      suffixIconColor: AppColors.hint,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.backgroundDark.withOpacity(0.7),
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.backgroundDark.withOpacity(0.4),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.6),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 1.6),
      ),
      helperStyle: const TextStyle(color: Colors.white70, fontSize: 12),
      errorStyle: const TextStyle(
        color: Colors.red,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    ),

    textTheme: AppTextStyles.textTheme,

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
  );
}
