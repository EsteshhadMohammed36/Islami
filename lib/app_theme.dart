import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.white,
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primaryColor,
      showSelectedLabels: true,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.blackColor,
        foregroundColor: AppColors.primaryColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.primaryColor)),
    textTheme: TextTheme(
        headlineLarge: TextStyle(
            fontSize: 36, fontWeight: FontWeight.bold, color: AppColors.white),
        headlineMedium: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.white),
        bodyLarge: TextStyle(
            color: AppColors.black, fontWeight: FontWeight.bold, fontSize: 20),
        bodyMedium: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.white),
        bodySmall: TextStyle(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold)),
  );
}
