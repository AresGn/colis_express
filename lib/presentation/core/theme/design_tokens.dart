import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Design tokens centralisés pour éviter la duplication de code
/// et assurer la cohérence visuelle dans toute l'application
class DesignTokens {
  // Espacement
  static const double spacingXs = 4.0;
  static const double spacingSm = 8.0;
  static const double spacingMd = 16.0;
  static const double spacingLg = 24.0;
  static const double spacingXl = 32.0;
  static const double spacingXxl = 48.0;

  // Rayons de bordure
  static const double radiusXs = 4.0;
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;
  static const double radiusRound = 999.0;

  // Élévations
  static const double elevationNone = 0.0;
  static const double elevationSm = 2.0;
  static const double elevationMd = 4.0;
  static const double elevationLg = 8.0;
  static const double elevationXl = 16.0;

  // Tailles de boutons
  static const double buttonHeightSm = 36.0;
  static const double buttonHeightMd = 48.0;
  static const double buttonHeightLg = 56.0;

  // Tailles d'icônes
  static const double iconSizeSm = 16.0;
  static const double iconSizeMd = 24.0;
  static const double iconSizeLg = 32.0;
  static const double iconSizeXl = 48.0;

  // Padding pour les champs de saisie
  static const EdgeInsets inputPadding = EdgeInsets.symmetric(
    horizontal: spacingMd,
    vertical: spacingMd,
  );

  // Padding pour les boutons
  static const EdgeInsets buttonPaddingSm = EdgeInsets.symmetric(
    horizontal: spacingMd,
    vertical: spacingSm,
  );
  static const EdgeInsets buttonPaddingMd = EdgeInsets.symmetric(
    horizontal: spacingLg,
    vertical: spacingMd,
  );
  static const EdgeInsets buttonPaddingLg = EdgeInsets.symmetric(
    horizontal: spacingXl,
    vertical: spacingLg,
  );

  // Styles de bordure
  static const BorderSide borderDefault = BorderSide(
    color: AppColors.inputBorder,
    width: 1.0,
  );
  static const BorderSide borderFocused = BorderSide(
    color: AppColors.primaryGreen,
    width: 2.0,
  );
  static const BorderSide borderError = BorderSide(
    color: AppColors.error,
    width: 1.0,
  );
  static const BorderSide borderErrorFocused = BorderSide(
    color: AppColors.error,
    width: 2.0,
  );

  // Durées d'animation
  static const Duration animationFast = Duration(milliseconds: 150);
  static const Duration animationNormal = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  // Courbes d'animation
  static const Curve curveDefault = Curves.easeInOut;
  static const Curve curveEaseIn = Curves.easeIn;
  static const Curve curveEaseOut = Curves.easeOut;
  static const Curve curveBounce = Curves.bounceOut;

  // Ombres
  static const List<BoxShadow> shadowSm = [
    BoxShadow(
      color: Color(0x0F000000),
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];
  static const List<BoxShadow> shadowMd = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 8,
      offset: Offset(0, 4),
    ),
  ];
  static const List<BoxShadow> shadowLg = [
    BoxShadow(
      color: Color(0x26000000),
      blurRadius: 16,
      offset: Offset(0, 8),
    ),
  ];

  // Méthodes utilitaires pour les couleurs avec opacité
  static Color withOpacity(Color color, double opacity) {
    return color.withValues(alpha: opacity);
  }

  // Méthodes utilitaires pour les BorderRadius
  static BorderRadius get borderRadiusDefault => BorderRadius.circular(radiusSm);
  static BorderRadius get borderRadiusMd => BorderRadius.circular(radiusMd);
  static BorderRadius get borderRadiusLg => BorderRadius.circular(radiusLg);
  static BorderRadius get borderRadiusRound => BorderRadius.circular(radiusRound);

  // Méthodes utilitaires pour les InputBorder
  static OutlineInputBorder get inputBorderDefault => OutlineInputBorder(
        borderRadius: borderRadiusDefault,
        borderSide: borderDefault,
      );
  
  static OutlineInputBorder get inputBorderFocused => OutlineInputBorder(
        borderRadius: borderRadiusDefault,
        borderSide: borderFocused,
      );
  
  static OutlineInputBorder get inputBorderError => OutlineInputBorder(
        borderRadius: borderRadiusDefault,
        borderSide: borderError,
      );
  
  static OutlineInputBorder get inputBorderErrorFocused => OutlineInputBorder(
        borderRadius: borderRadiusDefault,
        borderSide: borderErrorFocused,
      );
}
