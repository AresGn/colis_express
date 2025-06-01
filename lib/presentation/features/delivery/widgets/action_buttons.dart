import 'package:flutter/material.dart';

/// Boutons d'action pour l'é9cran de livraison confirmé9e
class ActionButtons extends StatelessWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onDownloadPressed;

  const ActionButtons({
    super.key,
    required this.onHomePressed,
    required this.onDownloadPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Bouton Retour é0 l'accueil
          ElevatedButton(
            onPressed: onHomePressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: const Color(0xFF008751), // Green
              foregroundColor: Colors.white, // White text
              shadowColor: const Color(
                0xFF008751,
              ).withOpacity(0.4), // Green shadow
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.home),
                SizedBox(width: 8),
                Text('Retour é0 l\'accueil'),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Bouton Té9lé9charger le reé7u
          OutlinedButton(
            onPressed: onDownloadPressed,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: const BorderSide(color: Color(0xFFE5E7EB)),
              foregroundColor: const Color(0xFF6B7280), // Grey text
              backgroundColor: const Color(0xFFF8FAFC),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.download),
                SizedBox(width: 8),
                Text('Té9lé9charger le reé7u'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
