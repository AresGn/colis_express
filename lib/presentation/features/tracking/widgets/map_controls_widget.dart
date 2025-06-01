import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_colors.dart';

/// Widget pour les contrôles de la carte (boutons plein écran, retour, etc.)
class MapControlsWidget extends StatelessWidget {
  final bool isFullScreen;
  final VoidCallback onBackPressed;
  final VoidCallback onFullScreenToggle;

  const MapControlsWidget({
    super.key,
    required this.isFullScreen,
    required this.onBackPressed,
    required this.onFullScreenToggle,
  });

  @override
  Widget build(BuildContext context) {
    if (!isFullScreen) return const SizedBox.shrink();

    return Stack(
      children: [
        // Bouton retour
        Positioned(
          top: 16,
          left: 16,
          child: FloatingActionButton(
            mini: true,
            backgroundColor: Colors.white,
            foregroundColor: AppColors.textPrimary,
            child: const Icon(Icons.arrow_back),
            onPressed: onBackPressed,
          ),
        ),
        // Bouton sortie plein écran
        Positioned(
          top: 16,
          right: 16,
          child: FloatingActionButton(
            mini: true,
            backgroundColor: Colors.white,
            foregroundColor: AppColors.textPrimary,
            onPressed: onFullScreenToggle,
            child: const Icon(Icons.fullscreen_exit),
          ),
        ),
      ],
    );
  }
}
