import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_typography.dart';

class SplashBranding extends StatelessWidget {
  const SplashBranding({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Nom de l'application
        Text(
          'Bénin Express',
          style: AppTypography.h1.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 28,
            letterSpacing: 0.5,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.15),
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Slogan ou description
        Text(
          'Livraison de colis rapide et sécurisée',
          textAlign: TextAlign.center,
          style: AppTypography.body1.copyWith(
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
