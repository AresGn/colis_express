import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_colors.dart';
import 'package:benin_express/presentation/core/theme/app_typography.dart';
import 'package:benin_express/presentation/features/parcels/models/transport_option.dart';

/// Carte affichant une option de transport avec ses détails
class TransportOptionCard extends StatelessWidget {
  final TransportOption option;
  final bool isSelected;
  final VoidCallback onTap;

  const TransportOptionCard({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primaryGreen : AppColors.borderLight,
            width: isSelected ? 2 : 1,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Icône et couleur
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: option.iconColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(option.icon, color: option.iconColor, size: 24),
            ),
            const SizedBox(width: 16),

            // Informations du transport
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    option.name,
                    style: AppTypography.body1.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Temps de livraison: ${option.deliveryTime}',
                    style: AppTypography.body2.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            // Prix
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${option.price} FCFA',
                  style: AppTypography.h4.copyWith(
                    color: AppColors.primaryGreen,
                  ),
                ),
                if (isSelected)
                  const Icon(
                    Icons.check_circle,
                    color: AppColors.primaryGreen,
                    size: 20,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
