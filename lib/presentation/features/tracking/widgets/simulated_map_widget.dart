import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';

/// Widget pour afficher une carte simulée avec grille et marqueurs
/// Version temporaire en attendant l'intégration d'OpenStreetMap
class SimulatedMapWidget extends StatelessWidget {
  final List<Map<String, double>> routePoints;
  final Map<String, double> currentDeliveryPosition;
  final int currentRouteIndex;

  const SimulatedMapWidget({
    super.key,
    required this.routePoints,
    required this.currentDeliveryPosition,
    required this.currentRouteIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.green.shade100, Colors.blue.shade100],
        ),
      ),
      child: Stack(
        children: [
          // Grille de fond pour simuler une carte
          CustomPaint(size: Size.infinite, painter: _MapGridPainter()),
          // Marqueurs simulés
          _buildSimulatedMarkers(),
          // Route simulée
          _buildSimulatedRoute(),
          // Informations de position
          _buildPositionInfo(),
        ],
      ),
    );
  }

  Widget _buildSimulatedMarkers() {
    return Stack(
      children: [
        // Marqueur de départ
        Positioned(
          left: 50,
          top: 100,
          child: Icon(Icons.home, color: AppColors.primaryGreen, size: 30),
        ),
        // Marqueur d'arrivée
        Positioned(
          right: 50,
          bottom: 150,
          child: Icon(Icons.location_on, color: AppColors.primaryRed, size: 30),
        ),
        // Marqueur du livreur (position animée)
        AnimatedPositioned(
          duration: const Duration(seconds: 2),
          left: 50 + (currentRouteIndex * 60.0),
          top: 100 + (currentRouteIndex * 40.0),
          child: Icon(
            Icons.delivery_dining,
            color: AppColors.primaryBlue,
            size: 30,
          ),
        ),
      ],
    );
  }

  Widget _buildSimulatedRoute() {
    return CustomPaint(size: Size.infinite, painter: _RoutePainter());
  }

  Widget _buildPositionInfo() {
    return Positioned(
      top: 16,
      left: 16,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Position actuelle du livreur:',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Text(
              'Lat: ${currentDeliveryPosition['lat']?.toStringAsFixed(6)}',
              style: TextStyle(fontSize: 10),
            ),
            Text(
              'Lng: ${currentDeliveryPosition['lng']?.toStringAsFixed(6)}',
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}

/// Painter pour dessiner une grille de carte simulée
class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.grey.withValues(alpha: 0.3)
          ..strokeWidth = 1;

    // Dessiner une grille
    for (int i = 0; i < size.width; i += 50) {
      canvas.drawLine(
        Offset(i.toDouble(), 0),
        Offset(i.toDouble(), size.height),
        paint,
      );
    }

    for (int i = 0; i < size.height; i += 50) {
      canvas.drawLine(
        Offset(0, i.toDouble()),
        Offset(size.width, i.toDouble()),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Painter pour dessiner la route simulée
class _RoutePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = AppColors.primaryGreen
          ..strokeWidth = 4
          ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(50, 100); // Point de départ
    path.quadraticBezierTo(
      size.width / 2,
      size.height / 3,
      size.width - 50,
      size.height - 150,
    ); // Point d'arrivée

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
