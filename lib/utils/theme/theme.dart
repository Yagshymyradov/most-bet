import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    fontFamily: 'Sf-Pro-Regular',
    primaryColor: AppColors.primaryColor,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.textSecondaryColor),
        borderRadius: BorderRadius.circular(30),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.blackColor),
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(AppColors.primaryColor),
        minimumSize: const MaterialStatePropertyAll(Size(double.infinity, 63)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.primaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 34,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 22,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: AppColors.whiteColor,
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 15,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textSecondaryColor,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
    ),
  );
}

class AppColors {
  AppColors._();

  static const whiteColor = Colors.white;
  static const textSecondaryColor = Color.fromRGBO(174, 174, 174, 1);
  static const primaryColor = Color.fromRGBO(238, 89, 22, 1);
  static const darkColor = Color.fromRGBO(60, 60, 67, 1);
  static const blackColor = Colors.black;
}
