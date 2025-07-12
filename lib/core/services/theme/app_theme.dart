import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      // primaryContainer: AppColors.whiteColor,
      // secondaryContainer: AppColors.whiteColor,
      brightness: Brightness.light,
    ),

    // cardColor: AppColors.whiteColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) => AppColors.primaryColor,
        ),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        textStyle: WidgetStateProperty.all(
          TextStyle(fontWeight: FontWeight.bold),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.secondaryColor900,
      iconTheme: IconThemeData(color: AppColors.whiteColor, size: 24),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: AppColors.whiteColor,
      ),
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(AppColors.secondaryColor),
      trackVisibility: WidgetStateProperty.all(true),
      trackColor: WidgetStateProperty.all(
        AppColors.secondaryColor.withOpacity(.125),
      ),
      thumbVisibility: WidgetStateProperty.all(true),
      thickness: WidgetStateProperty.all(4),
      radius: const Radius.circular(25),
    ),
    checkboxTheme: const CheckboxThemeData(
      // activeColor: AppColors.secondaryColor,
      shape: CircleBorder(),
      side: BorderSide(color: AppColors.secondaryColor, width: 2),
    ),
    radioTheme: const RadioThemeData(
      fillColor: WidgetStatePropertyAll(AppColors.secondaryColor),
    ),
    fontFamily: 'Alexandria',
    textTheme: const TextTheme(
      labelSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
      labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    ),
    // pageTransitionsTheme: const PageTransitionsTheme(builders: {
    //   TargetPlatform.android: FadeThroughPageTransitionsBuilder(),
    // }),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      primaryContainer: AppColors.primaryColor,
      secondaryContainer: AppColors.secondaryColor,
      brightness: Brightness.dark,
    ),
    cardColor: const Color(0xFF4e4e5a),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) => AppColors.primaryColor,
        ),
        foregroundColor: WidgetStateProperty.all(Colors.black),
        textStyle: WidgetStateProperty.all(
          TextStyle(fontWeight: FontWeight.bold),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.barsColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.barsColor,
      iconTheme: IconThemeData(color: AppColors.primaryColor, size: 24),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: AppColors.primaryColor,
      ),
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(AppColors.secondaryColor),
      trackVisibility: WidgetStateProperty.all(true),
      trackColor: WidgetStateProperty.all(
        AppColors.secondaryColor.withOpacity(.125),
      ),
      thumbVisibility: WidgetStateProperty.all(true),
      thickness: WidgetStateProperty.all(4),
      radius: const Radius.circular(25),
    ),
    fontFamily: 'Alexandria',
    textTheme: const TextTheme(
      labelSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
      labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    ),
    // pageTransitionsTheme: const PageTransitionsTheme(builders: {
    //   TargetPlatform.android: FadeThroughPageTransitionsBuilder(),
    // }),
  );

  // static ThemeData getTheme(bool isDark) {
  //   return isDark ? _darkTheme : _lightTheme;
  // }
}
