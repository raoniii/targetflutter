import 'package:flutter/material.dart';

class ThemeConfig {
  static ThemeData getLoginTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: AppColors.primaryColor,
      hintColor: AppColors.hintColor,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.black,
      ),
    );
  }




  static BoxDecoration getGradientBackground() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.primaryColor,
          AppColors.secondaryColor,
        ],
      ),
    );
  }
}

class AppColors {
  static const Color primaryColor = Color(0xFF1f4e61);
  static const Color hintColor = Color(0xFF2e968f);
  static const Color secondaryColor = Color(0xFF2e968f);
}
