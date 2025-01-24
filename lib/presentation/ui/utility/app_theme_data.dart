import 'package:app/presentation/ui/utility/app_color.dart';
import 'package:flutter/material.dart';


class AppThemeData {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      primary: AppColors.primaryColor,
      background: Colors.white,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColors.primaryColor),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: Colors.grey.shade300,
        foregroundColor: Colors.black,
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColors.primaryColor),
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(fontSize: 20, color: Colors.grey.shade800),
      toolbarHeight: 40,
      elevation: 0.3,
      shadowColor: Colors.black,
      backgroundColor: Colors.white,
    ),
    // Integrate app bar theme into input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey[200], // Match app bar background color
      filled: true,
     labelStyle: TextStyle(color: Colors.grey.shade800), // Match app bar text color
      hintStyle: TextStyle(color: Colors.grey.shade800), // Match app bar text color
      //contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8), // Match app bar border radius
        borderSide: BorderSide(color: Colors.transparent, width: 1), // Match app bar border color
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.transparent, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: const Color.fromARGB(255, 236, 165, 165), width: 1), // Match app bar primary color
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.transparent, width: 1), // Customize error border color
      ),
    ),
  );
}
