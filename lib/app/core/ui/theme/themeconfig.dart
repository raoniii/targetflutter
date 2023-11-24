import 'package:flutter/material.dart';

class ThemeConfig {
  static ThemeData getLoginTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: Color(0xFF1f4e61),
      hintColor: Color(0xFF2e968f),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.black, // Cor do cursor
      ),
    );
  }

  static BoxDecoration getGradientBackground() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF1f4e61),
          Color(0xFF2e968f),
        ],
      ),
    );
  }
}
