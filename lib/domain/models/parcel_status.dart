import 'package:flutter/material.dart';

/// Statuts possibles d'un colis
enum ParcelStatus {
  pending, // En attente
  pickedUp, // Collecté
  inTransit, // En transit
  outForDelivery, // En cours de livraison
  delivered, // Livré
  cancelled, // Annulé
  processing, // En traitement
}

/// Extension pour ajouter des fonctionnalités au statut des colis
extension ParcelStatusExtension on ParcelStatus {
  String get displayName {
    switch (this) {
      case ParcelStatus.pending:
        return 'En attente';
      case ParcelStatus.pickedUp:
        return 'Collecté';
      case ParcelStatus.inTransit:
        return 'En transit';
      case ParcelStatus.outForDelivery:
        return 'En cours de livraison';
      case ParcelStatus.delivered:
        return 'Livré';
      case ParcelStatus.cancelled:
        return 'Annulé';
      case ParcelStatus.processing:
        return 'En traitement';
    }
  }

  Color get color {
    switch (this) {
      case ParcelStatus.pending:
        return const Color(0xFFFCD116); // Yellow
      case ParcelStatus.pickedUp:
        return const Color(0xFF3B82F6); // Blue
      case ParcelStatus.inTransit:
        return const Color(0xFF3B82F6); // Blue
      case ParcelStatus.outForDelivery:
        return const Color(0xFF3B82F6); // Blue
      case ParcelStatus.delivered:
        return const Color(0xFF008751); // Green
      case ParcelStatus.cancelled:
        return const Color(0xFFE8112D); // Red
      case ParcelStatus.processing:
        return const Color(0xFF9CA3AF); // Gray
    }
  }

  IconData get icon {
    switch (this) {
      case ParcelStatus.pending:
        return Icons.schedule;
      case ParcelStatus.pickedUp:
        return Icons.inventory_2;
      case ParcelStatus.inTransit:
        return Icons.local_shipping;
      case ParcelStatus.outForDelivery:
        return Icons.delivery_dining;
      case ParcelStatus.delivered:
        return Icons.check_circle;
      case ParcelStatus.cancelled:
        return Icons.cancel;
      case ParcelStatus.processing:
        return Icons.pending_actions;
    }
  }
}
