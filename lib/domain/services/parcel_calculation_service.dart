import 'package:agbantche/domain/models/transport_type.dart';

/// Service pour les calculs lié9s aux colis (prix, dé9lais, etc.)
class ParcelCalculationService {
  // Singleton pattern
  static final ParcelCalculationService _instance =
      ParcelCalculationService._internal();

  factory ParcelCalculationService() {
    return _instance;
  }

  ParcelCalculationService._internal();

  /// Calcule le prix d'un colis en fonction du type de transport
  double calculatePrice(
    TransportType transportType, {
    double? weight,
    String? dimensions,
  }) {
    final basePrice = 1000.0; // Prix de base en FCFA
    double price = basePrice * transportType.priceMultiplier;

    // Facteurs de prix supplé9mentaires en fonction du poids et des dimensions
    if (weight != null && weight > 5.0) {
      price += (weight - 5.0) * 100; // 100 FCFA par kg supplé9mentaire
    }

    return price;
  }

  /// Calcule la date de livraison estimé9e en fonction du type de transport
  DateTime calculateEstimatedDelivery(TransportType type) {
    switch (type) {
      case TransportType.express:
        return DateTime.now().add(const Duration(hours: 2));
      case TransportType.standard:
        return DateTime.now().add(const Duration(hours: 5));
      case TransportType.economic:
        return DateTime.now().add(const Duration(days: 1));
      case TransportType.moto:
        return DateTime.now().add(const Duration(hours: 3));
      case TransportType.car:
        return DateTime.now().add(const Duration(hours: 4));
      case TransportType.truck:
        return DateTime.now().add(const Duration(hours: 8));
    }
  }
}
