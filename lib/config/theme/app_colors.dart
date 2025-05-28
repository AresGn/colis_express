import 'package:flutter/material.dart';

/// App color palette
class AppColors {
  // Primary colors
  static const Color primaryYellow = Color(0xFFFCD116);
  static const Color primaryGreen = Color(0xFF008751);
  static const Color primaryRed = Color(0xFFE8112D);

  // Neutral colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color darkGrey = Color(0xFF333333);

  // Gradient colors
  static const List<Color> primaryGradient = [primaryYellow, primaryGreen];

  // Functional colors
  static const Color background = white;
  static const Color cardBackground = white;
  static const Color textPrimary = darkGrey;
  static const Color textSecondary = Color(0xFF666666);
  static const Color error = primaryRed;
  static const Color success = primaryGreen;

  // Component colors
  static const Color buttonPrimary = primaryGreen;
  static const Color buttonSecondary = primaryYellow;
  static const Color inputBorder = Color(0xFFDDDDDD);
  static const Color inputFill = lightGrey;
}
