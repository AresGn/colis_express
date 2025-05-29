import 'package:flutter/material.dart';

/// Types de transport disponibles
enum TransportType {
  express, // Livraison express (1-2h)
  standard, // Livraison standard (3-5h)
  economic, // Livraison u00e9conomique (6-24h)
  moto, // Transport par moto
  car, // Transport par voiture
  truck, // Transport par camion
}

/// Extension pour ajouter des fonctionnalitu00e9s aux types de transport
extension TransportTypeExtension on TransportType {
  String get displayName {
    switch (this) {
      case TransportType.express:
        return 'Express (1-2h)';
      case TransportType.standard:
        return 'Standard (3-5h)';
      case TransportType.economic:
        return 'u00c9conomique (6-24h)';
      case TransportType.moto:
        return 'Moto';
      case TransportType.car:
        return 'Voiture';
      case TransportType.truck:
        return 'Camion';
    }
  }

  double get priceMultiplier {
    switch (this) {
      case TransportType.express:
        return 2.0;
      case TransportType.standard:
        return 1.5;
      case TransportType.economic:
        return 1.0;
      case TransportType.moto:
        return 1.8;
      case TransportType.car:
        return 2.2;
      case TransportType.truck:
        return 2.5;
    }
  }

  IconData get icon {
    switch (this) {
      case TransportType.express:
        return Icons.electric_moped;
      case TransportType.standard:
        return Icons.delivery_dining;
      case TransportType.economic:
        return Icons.directions_bike;
      case TransportType.moto:
        return Icons.motorcycle;
      case TransportType.car:
        return Icons.directions_car;
      case TransportType.truck:
        return Icons.local_shipping;
    }
  }
}
