import 'package:benin_express/presentation/core/widgets/screen_header.dart';
import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_colors.dart';
import 'package:benin_express/presentation/core/theme/app_typography.dart';
import 'package:benin_express/presentation/core/widgets/custom_button.dart';
import 'package:benin_express/presentation/core/widgets/section_container.dart';
import 'package:benin_express/presentation/features/parcels/widgets/status_banner.dart';
import 'package:benin_express/presentation/features/tracking/screens/tracking_details_screen.dart';
import 'package:benin_express/presentation/features/tracking/widgets/timeline_step.dart'
    as TrackingTimelineStep;
import 'package:benin_express/presentation/features/parcels/widgets/status_banner.dart'
    show DeliveryStatus;
import 'package:benin_express/presentation/features/tracking/widgets/timeline_step.dart'
    show TrackingEventStatus;

class ConfirmationScreen extends StatelessWidget {
  final String trackingNumber;

  const ConfirmationScreen({super.key, required this.trackingNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // En-tête
            ScreenHeader(
              title: 'Commande confirmée',
              subtitle: trackingNumber,
              onBackPressed: () => Navigator.of(context).pop(),
            ),

            // Bannière de statut
            StatusBanner(
              emoji: '🚚',
              message: 'Votre colis est en préparation.',
              estimatedArrival: '17:30',
              status: DeliveryStatus.inTransit,
              statusTitle: 'Colis en préparation',
              statusDescription: 'Votre colis est en cours de conditionnement.',
            ),

            // Timeline des étapes
            Expanded(child: _buildTimelineContent()),

            // Actions rapides
            _buildQuickActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Message de confirmation
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Votre colis a été pris en charge !',
              style: AppTypography.h2,
            ),
          ),

          // Instructions
          Text(
            'Vous pouvez suivre votre colis avec le numéro de suivi ci-dessus. Nous vous tiendrons informé à chaque étape de la livraison.',
            style: AppTypography.body1.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 24),

          // Timeline de suivi
          SectionContainer(
            title: 'Étapes de la livraison',
            children: [
              Column(
                children: [
                  TrackingTimelineStep.TimelineStep(
                    title: 'Commande confirmée',
                    description: 'Votre commande a été créée',
                    time: 'Aujourd\'hui 14:30',
                    status: TrackingEventStatus.completed,
                  ),
                  TrackingTimelineStep.TimelineStep(
                    title: 'Préparation du colis',
                    description: 'Votre colis est en cours de préparation',
                    time: 'Aujourd\'hui 14:45',
                    status: TrackingEventStatus.current,
                  ),
                  TrackingTimelineStep.TimelineStep(
                    title: 'Collecte par transporteur',
                    description: 'Un transporteur va récupérer votre colis',
                    time: 'Aujourd\'hui 15:30 (estimé)',
                    status: TrackingEventStatus.upcoming,
                  ),
                  TrackingTimelineStep.TimelineStep(
                    title: 'En transit',
                    description: 'Votre colis est en route',
                    time: 'Aujourd\'hui 16:00 (estimé)',
                    status: TrackingEventStatus.upcoming,
                  ),
                  TrackingTimelineStep.TimelineStep(
                    title: 'Livraison',
                    description: 'Votre colis sera livré à destination',
                    time: 'Aujourd\'hui 17:30 (estimé)',
                    status: TrackingEventStatus.upcoming,
                    isLast: true,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Bouton Suivre le colis
          Expanded(
            child: CustomButton(
              text: 'Suivre mon colis',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => TrackingDetailsScreen(
                          trackingNumber: trackingNumber,
                        ),
                  ),
                );
              },
              variant: ButtonVariant.primary,
              size: ButtonSize.medium,
              isFullWidth: true,
            ),
          ),
          const SizedBox(width: 12),

          // Bouton Partager le suivi
          Expanded(
            child: CustomButton(
              text: 'Partager',
              icon: Icons.share,
              onPressed: () {
                // TODO: Implémenter le partage
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Fonctionnalité de partage à venir'),
                  ),
                );
              },
              variant: ButtonVariant.outline,
              size: ButtonSize.medium,
              isFullWidth: true,
            ),
          ),
        ],
      ),
    );
  }
}
