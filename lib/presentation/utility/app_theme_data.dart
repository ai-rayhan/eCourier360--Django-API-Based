import 'package:e_courier_360/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData lightThemData = ThemeData(
    primaryColor:  AppColors.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      elevation: 3,
      titleTextStyle: TextStyle(fontSize: 18, color: Colors.black),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      hintStyle: TextStyle(color: Colors.grey.shade400),
      labelStyle: TextStyle(color: Colors.grey.shade400),
      prefixIconColor: Colors.grey.shade400,
      suffixIconColor: Colors.grey.shade400,
      border: const OutlineInputBorder(
       borderSide: BorderSide.none
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide.none
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide.none
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide.none
      ),
    ),
    textTheme: TextTheme(
      titleLarge: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.grey.shade600,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: AppColors.secondaryColor,
        padding: const EdgeInsets.symmetric(vertical: 14),
        textStyle: const TextStyle(fontSize: 15, letterSpacing: 0.5),
        foregroundColor: Colors.white,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: const BorderSide(color: AppColors.secondaryColor,width: 2),
        padding: const EdgeInsets.symmetric(vertical: 10),
        textStyle: const TextStyle(fontSize: 15, letterSpacing: 0.5,color: AppColors.secondaryColor),
        foregroundColor: AppColors.secondaryColor
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
      ),
    ),
    
    tabBarTheme: const TabBarTheme(
          indicatorColor: AppColors.secondaryColor,
          labelStyle:TextStyle(color: Colors.white),
          labelColor: AppColors.secondaryColor,
          unselectedLabelStyle: TextStyle(color: Color(0x94FFFFFF)),),
    dividerTheme: const DividerThemeData(space: 0)

    
  );
}
