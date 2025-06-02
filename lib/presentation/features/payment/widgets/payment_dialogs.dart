import 'package:flutter/material.dart';
import 'package:agbantche/presentation/features/delivery/livraison_confirmee_screen.dart';

class PaymentDialogs {
  /// Affiche un dialogue de confirmation de paiement
  static Future<void> showConfirmationDialog(
    BuildContext context,
    String paymentMethod,
  ) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Paiement confirmé !'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Méthode: ${(paymentMethod == 'cash' ? 'Espèces' : 'Mobile Money')}',
              ),
              const Text('Montant: 2700 FCFA'), // Static amount
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                // Navigate to confirmation screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LivraisonConfirmeeScreen(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  /// Affiche un dialogue de refus de livraison
  static Future<void> showRefuseDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Refuser la livraison ?'),
          content: const Text(
            'Êtes-vous sûr de vouloir refuser cette livraison ? Le colis sera retourné à l\'expéditeur.',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
            ),
            TextButton(
              child: const Text('Refuser', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                // TODO: Implement refusal logic (e.g., navigate back, update status)
              },
            ),
          ],
        );
      },
    );
  }
}
