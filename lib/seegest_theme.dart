import 'package:flutter/material.dart';

class AppColors {
  static const Gradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFFEB5F49),
      Color(0xFFE73472),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const Color whiteColor = Colors.white;
  static const Color mainColor = Color(0xFF162968);
  static const Color secondaryColor = Color(0xFF42617A);
  static Color errorColor = Colors.red[700]!;
}

final seegestTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: AppColors.whiteColor,
    elevation: 0,
  ),
);
