import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/theme/app_typography.dart';

/// Bannière de statut pour l'affichage de l'état actuel d'un colis
class StatusBanner extends StatelessWidget {
  final String emoji;
  final String statusTitle;
  final String statusDescription;
  final String? estimatedArrival;
  final DeliveryStatus status;

  const StatusBanner({
    super.key,
    required this.emoji,
    required this.statusTitle,
    required this.statusDescription,
    this.estimatedArrival,
    required this.status,
    required String message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _getStatusGradient(),
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 32)),
          const SizedBox(height: 8),
          Text(
            statusTitle,
            style: AppTypography.h3.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            statusDescription,
            style: AppTypography.body2.copyWith(
              color: Colors.white.withOpacity(0.9),
            ),
            textAlign: TextAlign.center,
          ),
          if (estimatedArrival != null) ...[
            const SizedBox(height: 12),
            _buildEstimatedArrivalChip(),
          ],
        ],
      ),
    );
  }

  Widget _buildEstimatedArrivalChip() {
    return Chip(
      backgroundColor: Colors.white.withOpacity(0.7),
      label: Text(
        'Arrivée estimée: $estimatedArrival',
        style: AppTypography.chip.copyWith(color: AppColors.textPrimary),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
    );
  }

  List<Color> _getStatusGradient() {
    switch (status) {
      case DeliveryStatus.pending:
        return [
          AppColors.primaryYellow,
          AppColors.primaryYellow.withOpacity(0.7),
        ];
      case DeliveryStatus.inTransit:
        return AppColors.blueGradient;
      case DeliveryStatus.delivered:
        return [AppColors.success, AppColors.success.withOpacity(0.7)];
      case DeliveryStatus.cancelled:
        return [AppColors.error, AppColors.error.withOpacity(0.7)];
    }
  }
}

/// États possibles de livraison d'un colis
enum DeliveryStatus { pending, inTransit, delivered, cancelled }
