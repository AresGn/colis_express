import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_colors.dart';
import 'package:benin_express/presentation/core/theme/app_typography.dart';

/// Statut d'une étape de suivi
enum TrackingEventStatus { completed, current, upcoming }

/// Widget représentant une étape dans la timeline de suivi
class TimelineStep extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final TrackingEventStatus status;
  final bool isLast;

  const TimelineStep({
    super.key,
    required this.title,
    required this.description,
    required this.time,
    required this.status,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color iconColor = _getIconColor();
    final Color textColor = _getTextColor();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Colonne gauche: indicateur timeline
        _buildTimelineIndicator(iconColor),

        // Espace entre l'indicateur et le contenu
        const SizedBox(width: 12),

        // Colonne droite: contenu
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                time,
                style: AppTypography.caption.copyWith(
                  color: AppColors.textTertiary,
                ),
              ),

              // Espace en bas si ce n'est pas le dernier élément
              if (!isLast) const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineIndicator(Color iconColor) {
    return Column(
      children: [
        // Icône circulaire
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                status == TrackingEventStatus.upcoming
                    ? Colors.white
                    : iconColor,
            border:
                status == TrackingEventStatus.upcoming
                    ? Border.all(color: AppColors.borderLight, width: 1.5)
                    : null,
          ),
          child:
              status == TrackingEventStatus.completed
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
        ),

        // Ligne verticale si ce n'est pas le dernier élément
        if (!isLast)
          Container(
            width: 2,
            height: 40,
            color:
                status == TrackingEventStatus.upcoming
                    ? AppColors.borderLight
                    : iconColor,
          ),
      ],
    );
  }

  Color _getIconColor() {
    switch (status) {
      case TrackingEventStatus.completed:
        return AppColors.success;
      case TrackingEventStatus.current:
        return Colors.blue;
      case TrackingEventStatus.upcoming:
        return AppColors.borderLight;
    }
  }

  Color _getTextColor() {
    switch (status) {
      case TrackingEventStatus.completed:
      case TrackingEventStatus.current:
        return AppColors.textPrimary;
      case TrackingEventStatus.upcoming:
        return AppColors.textSecondary;
    }
  }
}
