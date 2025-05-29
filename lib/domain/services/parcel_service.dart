import 'package:benin_express/domain/models/parcel.dart';
import 'package:benin_express/domain/models/address.dart';
import 'package:benin_express/domain/models/contact.dart';
import 'package:benin_express/domain/models/parcel_status.dart';
import 'package:benin_express/domain/models/transport_type.dart';
import 'package:benin_express/domain/services/parcel_calculation_service.dart';
import 'package:benin_express/domain/services/parcel_history_service.dart';
import 'package:benin_express/domain/utils/id_generator.dart';

/// Service responsable de la gestion des colis
class ParcelService {
  // Singleton pattern
  static final ParcelService _instance = ParcelService._internal();
  final ParcelCalculationService _calculationService = ParcelCalculationService();
  final ParcelHistoryService _historyService = ParcelHistoryService();

  factory ParcelService() {
    return _instance;
  }

  ParcelService._internal();

  /// Mu00e9thode pour cru00e9er un nouveau colis
  Future<Parcel> createParcel({
    required String description,
    required Address pickupAddress,
    required Address deliveryAddress,
    required Contact sender,
    required Contact recipient,
    required TransportType transportType,
    double? weight,
    String? dimensions,
  }) async {
    // Simulation d'un appel API
    await Future.delayed(const Duration(seconds: 1));

    // Gu00e9nu00e9rer un ID unique et un numu00e9ro de suivi
    final id = IdGenerator.generateId('p');
    final trackingNumber = IdGenerator.generateTrackingNumber();

    // Calculer le prix basu00e9 sur le type de transport
    final price = _calculationService.calculatePrice(
      transportType,
      weight: weight,
      dimensions: dimensions,
    );

    // Cru00e9er et retourner un nouveau colis
    return Parcel(
      id: id,
      trackingNumber: trackingNumber,
      status: ParcelStatus.pending,
      description: description,
      createdAt: DateTime.now(),
      estimatedDelivery: _calculationService.calculateEstimatedDelivery(transportType),
      pickupAddress: pickupAddress,
      deliveryAddress: deliveryAddress,
      sender: sender,
      recipient: recipient,
      weight: weight,
      dimensions: dimensions,
      price: price,
      transportType: transportType,
      history: _historyService.createInitialHistory(),
    );
  }

  /// Mu00e9thode pour obtenir un colis par son numu00e9ro de suivi
  Future<Parcel?> getParcelByTrackingNumber(String trackingNumber) async {
    // Simulation d'un appel API
    await Future.delayed(const Duration(seconds: 1));

    // Pour l'exemple, nous retournons un colis fictif
    // Dans une vraie application, cela viendrait d'une API ou d'une base de donnu00e9es
    if (trackingNumber.startsWith('CE')) {
      return Parcel(
        id: 'p-12345',
        trackingNumber: trackingNumber,
        status: ParcelStatus.inTransit,
        description: 'Documents importants',
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
        updatedAt: DateTime.now().subtract(const Duration(hours: 2)),
        estimatedDelivery: DateTime.now().add(const Duration(hours: 3)),
        pickupAddress: Address(
          street: 'Quartier Akpakpa',
          city: 'Cotonou',
          state: 'Littoral',
          country: 'Bu00e9nin',
          district: '',
        ),
        deliveryAddress: Address(
          street: 'Quartier Houu00e9yiho',
          city: 'Cotonou',
          state: 'Littoral',
          country: 'Bu00e9nin',
          district: '',
        ),
        sender: Contact(
          name: 'Jean Dupont',
          phoneNumber: '+229 97123456',
          email: 'jean@example.com',
        ),
        recipient: Contact(
          name: 'Marie Koumako',
          phoneNumber: '+229 95789012',
        ),
        price: 1500,
        transportType: TransportType.standard,
        history: _historyService.generateDummyHistory(ParcelStatus.inTransit),
      );
    }

    return null;
  }

  /// Mu00e9thode pour obtenir les colis d'un utilisateur
  Future<List<Parcel>> getUserParcels(String userId) async {
    // Simulation d'un appel API
    await Future.delayed(const Duration(seconds: 1));

    // Dans une vraie application, nous interrogerions la base de donnu00e9es
    // Pour l'exemple, nous retournons une liste de colis fictifs
    return [
      Parcel(
        id: 'p-12345',
        trackingNumber: 'CE2024-001',
        status: ParcelStatus.delivered,
        description: 'Documents importants',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now().subtract(const Duration(hours: 3)),
        estimatedDelivery: DateTime.now().subtract(const Duration(hours: 1)),
        deliveryDate: DateTime.now().subtract(const Duration(hours: 3)),
        pickupAddress: Address(
          street: 'Quartier Akpakpa',
          city: 'Cotonou',
          state: 'Littoral',
          country: 'Bu00e9nin',
          district: '',
        ),
        deliveryAddress: Address(
          street: 'Quartier Houu00e9yiho',
          city: 'Cotonou',
          state: 'Littoral',
          country: 'Bu00e9nin',
          district: '',
        ),
        sender: Contact(
          name: 'Jean Dupont',
          phoneNumber: '+229 97123456',
        ),
        recipient: Contact(
          name: 'Marie Koumako',
          phoneNumber: '+229 95789012',
        ),
        price: 1500,
        transportType: TransportType.standard,
        history: _historyService.generateDummyHistory(ParcelStatus.delivered),
      ),
      Parcel(
        id: 'p-12346',
        trackingNumber: 'CE2024-002',
        status: ParcelStatus.outForDelivery,
        description: 'Matu00e9riel informatique',
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
        updatedAt: DateTime.now().subtract(const Duration(hours: 1)),
        estimatedDelivery: DateTime.now().add(const Duration(hours: 1)),
        pickupAddress: Address(
          street: 'Quartier Akpakpa',
          city: 'Cotonou',
          state: 'Littoral',
          country: 'Bu00e9nin',
          district: '',
        ),
        deliveryAddress: Address(
          street: 'Quartier Cadjehoun',
          city: 'Cotonou',
          state: 'Littoral',
          country: 'Bu00e9nin',
          district: '',
        ),
        sender: Contact(
          name: 'Jean Dupont',
          phoneNumber: '+229 97123456',
        ),
        recipient: Contact(
          name: 'Jean Adjo',
          phoneNumber: '+229 95456789',
        ),
        price: 2500,
        transportType: TransportType.express,
        history: _historyService.generateDummyHistory(ParcelStatus.outForDelivery),
      ),
    ];
  }

  /// Mu00e9thode pour mettre u00e0 jour le statut d'un colis
  Future<Parcel> updateParcelStatus({
    required String parcelId,
    required ParcelStatus newStatus,
    String? description,
    String? location,
  }) async {
    // Simulation d'un appel API
    await Future.delayed(const Duration(seconds: 1));

    // Dans une vraie application, cela mettrait u00e0 jour un colis existant
    // Pour l'exemple, nous retournons un colis fictif
    final parcel = await getParcelByTrackingNumber('CE2024-001');

    if (parcel == null) {
      throw Exception('Colis non trouvu00e9');
    }

    // Ajouter une nouvelle entru00e9e dans l'historique
    final history = _historyService.addHistoryEntry(
      existingHistory: parcel.history,
      status: newStatus.displayName,
      description: description ?? 'Statut mis u00e0 jour',
      location: location,
    );

    // Dans une vraie application, nous mettrions u00e0 jour la base de donnu00e9es
    // Pour l'exemple, nous retournons un nouveau colis avec le statut mis u00e0 jour
    return Parcel(
      id: parcel.id,
      trackingNumber: parcel.trackingNumber,
      status: newStatus,
      description: parcel.description,
      createdAt: parcel.createdAt,
      updatedAt: DateTime.now(),
      estimatedDelivery: parcel.estimatedDelivery,
      deliveryDate: newStatus == ParcelStatus.delivered ? DateTime.now() : null,
      pickupAddress: parcel.pickupAddress,
      deliveryAddress: parcel.deliveryAddress,
      sender: parcel.sender,
      recipient: parcel.recipient,
      weight: parcel.weight,
      dimensions: parcel.dimensions,
      price: parcel.price,
      transportType: parcel.transportType,
      history: history,
    );
  }
}
