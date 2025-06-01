import 'package:flutter/material.dart';
import 'dart:async';
import 'package:benin_express/presentation/core/theme/app_colors.dart';
import 'package:benin_express/presentation/features/tracking/widgets/delivery_info_card.dart';
import 'package:benin_express/presentation/features/tracking/widgets/simulated_map_widget.dart';
import 'package:benin_express/presentation/features/tracking/widgets/map_controls_widget.dart';
import 'package:benin_express/presentation/features/tracking/widgets/delivery_simulation_widget.dart';

/// Écran affichant la carte de suivi d'un colis
/// Version temporaire simplifiée pour éviter les crashes OSM
class TrackingMapScreen extends StatefulWidget {
  final String trackingNumber;

  const TrackingMapScreen({super.key, required this.trackingNumber});

  @override
  State<TrackingMapScreen> createState() => _TrackingMapScreenState();
}

class _TrackingMapScreenState extends State<TrackingMapScreen> {
  bool _isLoading = true;
  bool _isFullScreen = false;

  // Coordonnées du trajet (simulation simple)
  final List<Map<String, double>> _routePoints = [
    {'lat': 6.392383, 'lng': 2.394288}, // Point de départ
    {'lat': 6.390000, 'lng': 2.380000}, // Point intermédiaire 1
    {'lat': 6.388000, 'lng': 2.370000}, // Point intermédiaire 2
    {'lat': 6.387000, 'lng': 2.360000}, // Point intermédiaire 3
    {'lat': 6.385538, 'lng': 2.343031}, // Point d'arrivée
  ];

  // Position actuelle du livreur (simulée)
  Map<String, double> _currentDeliveryPosition = {
    'lat': 6.390000,
    'lng': 2.380000,
  };

  // Index de route actuel
  int _currentRouteIndex = 1;

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _initializeMap() async {
    // Simulation simple du chargement
    await Future.delayed(const Duration(seconds: 1));

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });
  }

  void _handlePositionUpdate(Map<String, double> position, int routeIndex) {
    setState(() {
      _currentDeliveryPosition = position;
      _currentRouteIndex = routeIndex;
    });
  }

  void _handleDeliveryCompleted() {
    // Logique à exécuter quand la livraison est terminée
    debugPrint('Livraison terminée - Notification à l\'utilisateur');
  }

  void _handleBackPressed() {
    if (_isFullScreen) {
      _toggleFullScreen();
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar:
          _isFullScreen
              ? null
              : AppBar(
                title: Text('Suivi de ${widget.trackingNumber}'),
                backgroundColor: AppColors.white,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.fullscreen),
                    onPressed: _toggleFullScreen,
                  ),
                ],
              ),
      body: SafeArea(
        child: Stack(
          children: [
            // Carte simulée ou indicateur de chargement
            _isLoading
                ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryGreen,
                  ),
                )
                : SimulatedMapWidget(
                  routePoints: _routePoints,
                  currentDeliveryPosition: _currentDeliveryPosition,
                  currentRouteIndex: _currentRouteIndex,
                ),

            // Widget de simulation de livraison
            if (!_isLoading)
              DeliverySimulationWidget(
                routePoints: _routePoints,
                onPositionUpdate: _handlePositionUpdate,
                onDeliveryCompleted: _handleDeliveryCompleted,
              ),

            // Contrôles de carte (boutons plein écran)
            MapControlsWidget(
              isFullScreen: _isFullScreen,
              onBackPressed: _handleBackPressed,
              onFullScreenToggle: _toggleFullScreen,
            ),

            // Informations du livreur et carte d'info en bas
            if (!_isFullScreen)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: DeliveryInfoCard(
                  onCallPressed: () {
                    // TODO: Implémenter l'action d'appel
                  },
                  onChatPressed: () {
                    // TODO: Implémenter l'action de chat
                  },
                  onSharePressed: () {
                    // TODO: Implémenter l'action de partage
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
