import 'package:flutter/material.dart';
import 'package:hotel_booking_mock/utilities/colors/app_colors.dart';

final class AppTheme {
  static ThemeData get lightTheme =>
      ThemeData.light(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: AppColors.scaffoldColor,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(8),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.bottomNavColor,
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
          ),
          selectedItemColor: Colors.deepOrange,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 20,
          backgroundColor: Colors.white,
        ),
        tabBarTheme: const TabBarTheme(
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
        ),
      );
  static ThemeData get darkTheme => ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: AppColors.scaffoldColor,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(8),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.bottomNavColor,
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 20,
        ),
      );
}
