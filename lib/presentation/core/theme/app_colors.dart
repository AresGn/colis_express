import 'package:flutter/material.dart';

/// App color palette - Organized by category for better maintainability
class AppColors {
  // Primary Brand Colors
  static const Color primaryYellow = Color(0xFFFCD116);
  static const Color primaryGreen = Color(0xFF008751);
  static const Color primaryRed = Color(0xFFE8112D);
  static const Color primaryBlue = Color(0xFF3B82F6);
  static const Color secondaryBlue = Color(0xFF60A5FA);

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color mediumGrey = Color(0xFFE5E7EB);
  static const Color darkGrey = Color(0xFF333333);
  static const Color black = Color(0xFF000000);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF1F2937);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textTertiary = Color(0xFF9CA3AF);
  static const Color textLight = white;
  
  // Background Colors
  static const Color background = Color(0xFFF8FAFC);
  static const Color cardBackground = white;
  static const Color inputFill = lightGrey;
  
  // Border Colors
  static const Color borderLight = Color(0xFFE5E7EB);
  static const Color inputBorder = Color(0xFFDDDDDD);
  
  // Functional Colors
  static const Color success = primaryGreen;
  static const Color error = primaryRed;
  static const Color warning = primaryYellow;
  static const Color info = primaryBlue;
  
  // Component Colors
  static const Color buttonPrimary = primaryGreen;
  static const Color buttonSecondary = primaryYellow;
  static const Color buttonDisabled = Color(0xFFCCCCCC);
  
  // Gradient Colors
  static const List<Color> primaryGradient = [primaryYellow, primaryGreen];
  static const List<Color> blueGradient = [primaryBlue, secondaryBlue];
  
  // Status Colors
  static const Color statusActive = primaryGreen;
  static const Color statusPending = primaryYellow;
  static const Color statusCancelled = primaryRed;
  static const Color statusInTransit = primaryBlue;
}
