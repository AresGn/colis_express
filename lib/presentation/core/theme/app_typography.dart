import 'package:flutter/material.dart';

/// App typography - Styles de texte organisés par taille et usage
class AppTypography {
  // Headings
  static const TextStyle h1 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    height: 1.2,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    height: 1.2,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );

  static const TextStyle h4 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );

  // Body text
  static const TextStyle body1 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  static const TextStyle body2 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  // Other text styles
  static const TextStyle button = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    height: 1.0,
    letterSpacing: 0.5,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    height: 1.4,
  );

  static const TextStyle label = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  static const TextStyle chip = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    height: 1.0,
  );

  static const TextStyle smallButton = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    height: 1.0,
  );

  // Style utilitaires
  static TextStyle withColor(TextStyle base, Color color) {
    return base.copyWith(color: color);
  }
}
