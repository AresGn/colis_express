import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/theme/app_typography.dart';

/// Widget d'en-tête affichant les informations de trajet
class TransportHeaderInfo extends StatelessWidget {
  final String fromCity;
  final String toCity;
  final String estimatedDistance;
  final String subtitle;

  const TransportHeaderInfo({
    super.key,
    required this.fromCity,
    required this.toCity,
    required this.estimatedDistance,
    this.subtitle = 'Transporteurs disponibles',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre du trajet
          Row(
            children: [
              Icon(Icons.location_on, color: AppColors.white, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '$fromCity → $toCity',
                  style: AppTypography.h3.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),

          // Distance estimée
          Text(
            'Distance estimée: ~$estimatedDistance',
            style: AppTypography.body2.copyWith(
              color: AppColors.white.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }
}
