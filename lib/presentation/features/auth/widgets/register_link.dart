import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/theme/app_typography.dart';

/// Lien vers l'é9cran d'inscription en bas de l'é9cran de connexion
class RegisterLink extends StatelessWidget {
  final VoidCallback onPressed;

  const RegisterLink({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Vous n\'avez pas de compte?', style: AppTypography.body2),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'S\'inscrire',
            style: AppTypography.body2.copyWith(
              color: AppColors.primaryGreen,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
