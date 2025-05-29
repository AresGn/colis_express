import 'package:benin_express/domain/models/parcel_status.dart';
import 'package:benin_express/domain/models/parcel_history_entry.dart';

/// Service de gestion de l'historique des colis
class ParcelHistoryService {
  // Singleton pattern
  static final ParcelHistoryService _instance = ParcelHistoryService._internal();

  factory ParcelHistoryService() {
    return _instance;
  }

  ParcelHistoryService._internal();

  /// Ajoute une nouvelle entrée à l'historique d'un colis
  List<ParcelHistoryEntry> addHistoryEntry({
    required List<ParcelHistoryEntry>? existingHistory,
    required String status,
    required String description,
    String? location,
  }) {
    final history = List<ParcelHistoryEntry>.from(existingHistory ?? []);
    
    history.add(
      ParcelHistoryEntry(
        timestamp: DateTime.now(),
        status: status,
        description: description,
        location: location,
      ),
    );
    
    return history;
  }

  /// Crée l'entrée initiale de l'historique pour un nouveau colis
  List<ParcelHistoryEntry> createInitialHistory() {
    return [
      ParcelHistoryEntry(
        timestamp: DateTime.now(),
        status: 'Créé',
        description: 'Commande créée',
        location: 'Système',
      ),
    ];
  }

  /// Génère un historique fictif pour les tests
  List<ParcelHistoryEntry> generateDummyHistory(ParcelStatus status) {
    final history = <ParcelHistoryEntry>[];
    final now = DateTime.now();
    
    // Entrée initiale
    history.add(
      ParcelHistoryEntry(
        timestamp: now.subtract(const Duration(hours: 5)),
        status: 'Créé',
        description: 'Commande créée',
        location: 'Système',
      ),
    );
    
    // Ajout d'entrées en fonction du statut actuel
    if (status.index >= ParcelStatus.pickedUp.index) {
      history.add(
        ParcelHistoryEntry(
          timestamp: now.subtract(const Duration(hours: 4)),
          status: 'Collecté',
          description: 'Colis collecté par le transporteur',
          location: 'Cotonou, Akpakpa',
        ),
      );
    }
    
    if (status.index >= ParcelStatus.inTransit.index) {
      history.add(
        ParcelHistoryEntry(
          timestamp: now.subtract(const Duration(hours: 2)),
          status: 'En transit',
          description: 'Colis en route vers la destination',
          location: 'En transit',
        ),
      );
    }
    
    if (status.index >= ParcelStatus.outForDelivery.index) {
      history.add(
        ParcelHistoryEntry(
          timestamp: now.subtract(const Duration(hours: 1)),
          status: 'En cours de livraison',
          description: 'Colis en cours de livraison',
          location: 'Cotonou, Houéyiho',
        ),
      );
    }
    
    if (status == ParcelStatus.delivered) {
      history.add(
        ParcelHistoryEntry(
          timestamp: now,
          status: 'Livré',
          description: 'Colis livré avec succès',
          location: 'Cotonou, Houéyiho',
        ),
      );
    }
    
    return history;
  }
}
