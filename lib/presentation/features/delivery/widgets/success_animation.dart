import 'package:flutter/material.dart';

/// Widget qui affiche une animation de succu00e8s avec des cercles concentriques
class SuccessAnimation extends StatelessWidget {
  final double size;
  final Color primaryColor;

  const SuccessAnimation({
    super.key,
    this.size = 160.0,
    this.primaryColor = const Color(0xFF10B981),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Anneaux animu00e9s (simulu00e9s avec des containers)
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: primaryColor.withOpacity(0.2),
                  width: 8,
                ),
              ),
            ),
            Container(
              width: size - 20,
              height: size - 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: primaryColor.withOpacity(0.3),
                  width: 8,
                ),
              ),
            ),
            // Cercle vert du00e9gradu00e9 et icu00f4ne check
            Container(
              width: size - 40,
              height: size - 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [const Color(0xFF008751), primaryColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 60, // Taille ajustu00e9e
              ),
            ),
          ],
        ),
      ),
    );
  }
}
