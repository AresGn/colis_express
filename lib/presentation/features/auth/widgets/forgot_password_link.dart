import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/theme/app_typography.dart';

/// Lien vers la page de ré9cupé9ration de mot de passe
class ForgotPasswordLink extends StatelessWidget {
  final VoidCallback onPressed;

  const ForgotPasswordLink({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          'Mot de passe oublié9?',
          style: AppTypography.body2.copyWith(
            color: AppColors.primaryGreen,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
