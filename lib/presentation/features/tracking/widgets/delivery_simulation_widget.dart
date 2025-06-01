import 'dart:async';
import 'package:flutter/material.dart';

/// Widget responsable de la simulation du mouvement du livreur
/// Gère la logique de simulation et les mises à jour de position
class DeliverySimulationWidget extends StatefulWidget {
  final List<Map<String, double>> routePoints;
  final Function(Map<String, double>, int) onPositionUpdate;
  final Function() onDeliveryCompleted;

  const DeliverySimulationWidget({
    super.key,
    required this.routePoints,
    required this.onPositionUpdate,
    required this.onDeliveryCompleted,
  });

  @override
  State<DeliverySimulationWidget> createState() => _DeliverySimulationWidgetState();
}

class _DeliverySimulationWidgetState extends State<DeliverySimulationWidget> {
  Timer? _simulationTimer;
  int _currentRouteIndex = 1;
  Map<String, double> _currentPosition = {'lat': 6.390000, 'lng': 2.380000};

  @override
  void initState() {
    super.initState();
    _startSimulation();
  }

  @override
  void dispose() {
    _simulationTimer?.cancel();
    super.dispose();
  }

  void _startSimulation() {
    _simulationTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentRouteIndex < widget.routePoints.length - 1) {
        setState(() {
          _currentPosition = widget.routePoints[_currentRouteIndex];
          _currentRouteIndex++;
        });

        // Notifier le parent de la mise à jour de position
        widget.onPositionUpdate(_currentPosition, _currentRouteIndex);

        // Log pour debug
        debugPrint(
          'Livreur à la position: ${_currentPosition['lat']}, ${_currentPosition['lng']}',
        );
      } else {
        // Livraison terminée
        timer.cancel();
        debugPrint('Livraison terminée !');
        widget.onDeliveryCompleted();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Ce widget ne rend rien visuellement, il gère seulement la logique
    return const SizedBox.shrink();
  }
}
