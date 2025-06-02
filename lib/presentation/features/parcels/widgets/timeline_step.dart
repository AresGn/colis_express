import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/theme/app_typography.dart';

/// Étape individuelle dans une timeline de suivi
class TimelineStep extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String? description;
  final String time;
  final bool isLast;
  final bool isAnimating;

  const TimelineStep({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    this.description,
    required this.time,
    this.isLast = false,
    this.isAnimating = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Colonne de gauche avec l'icône et la ligne
        SizedBox(
          width: 30,
          child: Column(
            children: [
              // Icône d'étape
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child:
                    isAnimating
                        ? _buildAnimatedIcon()
                        : Icon(icon, color: iconColor, size: 16),
              ),
              // Ligne verticale, sauf pour la dernière étape
              if (!isLast)
                Container(
                  width: 2,
                  height: 40,
                  margin: const EdgeInsets.only(top: 8),
                  color: AppColors.borderLight,
                ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        // Contenu de l'étape (textes)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.body1.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              if (description != null) ...[
                const SizedBox(height: 4),
                Text(
                  description!,
                  style: AppTypography.body2.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
              const SizedBox(height: 4),
              Text(
                time,
                style: AppTypography.caption.copyWith(
                  color: AppColors.textTertiary,
                ),
              ),
              // Espacement vertical entre les étapes
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  // Animation simple pour l'icône en cours
  Widget _buildAnimatedIcon() {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.8, end: 1.0),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Icon(icon, color: iconColor, size: 16),
        );
      },
      // Pour que l'animation se répète
      onEnd: () => {},
    );
  }
}
