import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    fontFamily: 'Sf-Pro-Regular',
    primaryColor: AppColors.primaryColor,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: AppColors.greyColor,
      ),
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
        backgroundColor: const WidgetStatePropertyAll(AppColors.primaryColor),
        minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 63)),
        shape: WidgetStatePropertyAll(
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
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 17,
        color: AppColors.greyColor,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textSecondaryColor,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
      displaySmall: TextStyle(
        color: AppColors.textSecondaryColor,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
    ),
  );
}

class AppColors {
  AppColors._();

  static const whiteColor = Colors.white;
  static const textSecondaryColor = Color.fromRGBO(174, 174, 174, 1);
  static const greyColor = Color.fromRGBO(128, 133, 142, 1);
  static const lightGreenColor = Color.fromRGBO(57, 208, 54, 1);
  static const greenColor = Color.fromRGBO(39, 207, 35, 1);
  static const easyYellowColor = Color.fromRGBO(208, 184, 54, 1);
  static const lightYellowColor = Color.fromRGBO(247, 170, 95, 1);
  static const yellowColor = Color.fromRGBO(235, 137, 42, 1);
  static const darkYellowColor = Color.fromRGBO(200, 107, 17, 1);
  static const primaryColor = Color.fromRGBO(238, 89, 22, 1);
  static const easyRedColor = Color.fromRGBO(245, 65, 65, 1);
  static const lightRedColor = Color.fromRGBO(255, 5, 5, 1);
  static const redColor = Color.fromRGBO(241, 17, 17, 1);
  static const darkRedColor = Color.fromRGBO(205, 19, 19, 1);
  static const darkColor = Color.fromRGBO(60, 60, 67, 1);
  static const blackColor = Colors.black;
}
