import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/theme/app_typography.dart';

/// Case é0 cocher pour l'acceptation des conditions d'utilisation
class TermsCheckbox extends StatelessWidget {
  final bool accepted;
  final VoidCallback onToggle;

  const TermsCheckbox({
    super.key,
    required this.accepted,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: accepted,
          onChanged: (_) => onToggle(),
          activeColor: AppColors.primaryGreen,
        ),
        Expanded(
          child: GestureDetector(
            onTap: onToggle,
            child: RichText(
              text: TextSpan(
                text: 'J\'accepte les ',
                style: AppTypography.body2.copyWith(
                  color: AppColors.textSecondary,
                ),
                children: [
                  TextSpan(
                    text: 'conditions d\'utilisation',
                    style: AppTypography.body2.copyWith(
                      color: AppColors.primaryGreen,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const TextSpan(text: ' et la '),
                  TextSpan(
                    text: 'politique de confidentialité9',
                    style: AppTypography.body2.copyWith(
                      color: AppColors.primaryGreen,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
