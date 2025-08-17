import 'package:flutter/material.dart';
import 'package:iti_project/core/constants/app_colors.dart';
import 'package:iti_project/core/themes/app_text_styles.dart';

// text - appBar - elebatedButton - textformfield - bottomAppBar
class AppTheme {
  /// Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),
      ),
    ),
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

    // ElevatedButton
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size(48, 48)),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        elevation: WidgetStateProperty.resolveWith<double>((states) {
          if (states.contains(WidgetState.disabled)) return 0;
          if (states.contains(WidgetState.pressed)) return 2;
          return 4;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.primary.withOpacity(0.4);
          }
          if (states.contains(WidgetState.pressed)) {
            return AppColors.splash;
          }
          return AppColors.primary;
        }),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        overlayColor: WidgetStateProperty.all(Colors.white.withOpacity(0.06)),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
        ),
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

    textTheme: TextTheme(
      displayLarge: AppTextStyles.headline1, // 35, bold
      displayMedium: AppTextStyles.headline2, // 30, w500
      titleLarge: AppTextStyles.titleLarge, // 20, w400
      titleMedium: AppTextStyles.titleMedium, // 18, w500
      bodyLarge: AppTextStyles.bodyLarge, // 16, w800
      bodySmall: AppTextStyles.bodySmall, // 14, w500
      labelSmall: AppTextStyles.labelSmall, // 12, w400
    ),
  );

  /// Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),
      ),
    ),
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

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size(48, 48)),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        elevation: WidgetStateProperty.resolveWith<double>((states) {
          if (states.contains(WidgetState.disabled)) return 0;
          if (states.contains(WidgetState.pressed)) return 2;
          return 4;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.primary.withOpacity(0.5);
          }
          if (states.contains(WidgetState.pressed)) {
            return AppColors.splash;
          }
          return AppColors.primary;
        }),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        overlayColor: WidgetStateProperty.all(Colors.white.withOpacity(0.08)),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
        ),
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

    textTheme: TextTheme(
      displayLarge: AppTextStyles.headline1, // 35, bold
      displayMedium: AppTextStyles.headline2, // 30, w500
      titleLarge: AppTextStyles.titleLarge, // 20, w400
      titleMedium: AppTextStyles.titleMedium, // 18, w500
      bodyLarge: AppTextStyles.bodyLarge, // 16, w800
      bodySmall: AppTextStyles.bodySmall, // 14, w500
      labelSmall: AppTextStyles.labelSmall, // 12, w400
    ),
  );
  // static ThemeData? light = ThemeData(
  //   primaryColor: AppColors.kPrimaryColor,
  //   scaffoldBackgroundColor: AppColors.kBackColor1,
  //   inputDecorationTheme: InputDecorationTheme(
  //     filled: true,
  //     fillColor: Colors.grey[200],
  //     hintStyle: AppTextStyles.kHomeSearch,
  //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
  //     contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
  //   ),
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: ElevatedButton.styleFrom(
  //       minimumSize: const Size(360, 60),
  //       backgroundColor: AppColors.kPrimaryColor,
  //       textStyle: AppTextStyles.kButtonText,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //     ),
  //   ),
  //   textButtonTheme: TextButtonThemeData(
  //     style: TextButton.styleFrom(
  //       foregroundColor: Colors.white,
  //       textStyle: AppTextStyles.kButtonText,
  //     ),
  //   ),
  // );
}
