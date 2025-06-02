import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';

/// Widget d'en-téate pour l'é9cran d'inscription
class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Inscription',
          style:
              Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ) ??
              const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Cré9ez votre compte pour commencer é0 utiliser Colis Express Bé9nin',
          style:
              Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ) ??
              const TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ],
    );
  }
}
