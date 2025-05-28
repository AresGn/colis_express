import 'package:flutter/material.dart';
import 'package:benin_express/config/theme/app_typography.dart';
import 'package:benin_express/config/theme/app_colors.dart';

class SplashBranding extends StatelessWidget {
  const SplashBranding({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Colis Express',
          style: AppTypography.h1.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Bénin',
          style: AppTypography.h2.copyWith(
            color: Colors.white.withOpacity(0.95),
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: 280,
          child: Text(
            'Livraison rapide et sécurisée de vos colis partout au Bénin',
            style: AppTypography.body1.copyWith(
              color: Colors.white.withOpacity(0.9),
              fontSize: 16,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
