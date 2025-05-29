import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/widgets/custom_button.dart';
import 'package:benin_express/presentation/features/tracking/screens/tracking_map_screen.dart';

/// Widget qui affiche les boutons d'action pour le suivi du colis
class TrackingActionButtons extends StatelessWidget {
  final String trackingNumber;
  final bool isCollected;
  final VoidCallback onCollectPressed;

  const TrackingActionButtons({
    super.key,
    required this.trackingNumber,
    required this.isCollected,
    required this.onCollectPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildMapButton(context),
            const SizedBox(height: 12),
            if (!isCollected) _buildCollectButton(),
          ],
        ),
      ),
    );
  }

  // Bouton pour voir sur la carte
  Widget _buildMapButton(BuildContext context) {
    return CustomButton(
      text: 'Voir sur la carte',
      icon: Icons.map,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TrackingMapScreen(trackingNumber: trackingNumber),
          ),
        );
      },
      variant: ButtonVariant.outline,
      isFullWidth: true,
    );
  }

  // Bouton de confirmation de réception
  Widget _buildCollectButton() {
    return CustomButton(
      text: 'Confirmer la réception',
      onPressed: onCollectPressed,
      variant: ButtonVariant.primary,
      isFullWidth: true,
    );
  }
}
