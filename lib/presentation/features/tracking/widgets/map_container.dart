import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_colors.dart';

/// Widget qui affiche la carte de suivi (simulée pour l'exemple)
class MapContainer extends StatelessWidget {
  final bool isLoading;
  final bool isFullScreen;
  final VoidCallback onFullScreenToggle;
  final VoidCallback onBackPressed;

  const MapContainer({
    Key? key,
    required this.isLoading,
    required this.isFullScreen,
    required this.onFullScreenToggle,
    required this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primaryGreen),
      );
    }

    // Simulation d'une carte avec un Container coloré
    // À remplacer par une vraie implémentation de carte (Google Maps, etc.)
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xFFE7EAEE),
      child: Stack(
        children: [
          // Simuler des éléments de carte
          // Routes
          Positioned(
            top: 150,
            left: 50,
            right: 50,
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Positioned(
            top: 300,
            left: 150,
            right: 50,
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),

          // Marqueur de la position actuelle du livreur
          Positioned(
            top: 280,
            left: 120,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryGreen.withOpacity(0.4),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.delivery_dining,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),

          // Marqueur de destination
          Positioned(
            top: 150,
            right: 80,
            child: _buildMarker(
              color: AppColors.primaryRed,
              icon: Icons.location_on,
              label: 'Destination',
            ),
          ),

          // Marqueur de départ
          Positioned(
            top: 300,
            left: 80,
            child: _buildMarker(
              color: AppColors.primaryGreen,
              icon: Icons.home,
              label: 'Départ',
            ),
          ),

          // Boutons de contrôle en mode plein écran
          if (isFullScreen) ... [
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
        ],
      ),
    );
  }

  Widget _buildMarker({
    required Color color,
    required IconData icon,
    required String label,
  }) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}