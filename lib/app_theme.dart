import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.black,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.white,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.blackColor,
          foregroundColor: AppColors.primaryColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.primaryColor)));
}
