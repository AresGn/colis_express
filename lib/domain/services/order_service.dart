import 'package:agbantche/domain/models/order.dart';
import 'package:agbantche/domain/models/parcel.dart';
import 'package:agbantche/domain/models/address.dart';
import 'package:agbantche/domain/models/contact.dart';
import 'package:agbantche/domain/models/transport_type.dart';
import 'package:agbantche/domain/models/parcel_status.dart';
import 'package:agbantche/domain/services/payment_service.dart';
import 'package:agbantche/domain/utils/id_generator.dart';

/// Service responsable de la gestion des commandes
class OrderService {
  // Singleton pattern
  static final OrderService _instance = OrderService._internal();
  final PaymentService _paymentService = PaymentService();

  factory OrderService() {
    return _instance;
  }

  OrderService._internal();

  /// Cré9e une nouvelle commande
  Future<Order> createOrder({
    required String userId,
    required List<Parcel> parcels,
  }) async {
    // Simulation d'un appel API
    await Future.delayed(const Duration(seconds: 1));

    // Calculer le montant total
    final totalAmount = parcels.fold<double>(
      0,
      (sum, parcel) => sum + parcel.price,
    );

    // Gé9né9rer un ID unique et un numé9ro de commande
    final id = IdGenerator.generateId('o');
    final orderNumber = IdGenerator.generateOrderNumber();

    // Cré9er et retourner une nouvelle commande
    return Order(
      id: id,
      orderNumber: orderNumber,
      userId: userId,
      status: OrderStatus.pending,
      createdAt: DateTime.now(),
      totalAmount: totalAmount,
      parcels: parcels,
    );
  }

  /// Traite le paiement d'une commande (dé9lé9gation au PaymentService)
  Future<Payment> processPayment({
    required String orderId,
    required PaymentMethod method,
    required double amount,
    Map<String, dynamic>? additionalData,
  }) async {
    return _paymentService.processPayment(
      orderId: orderId,
      method: method,
      amount: amount,
      additionalData: additionalData,
    );
  }

  /// Obtient une commande par son ID
  Future<Order?> getOrderById(String orderId) async {
    // Simulation d'un appel API
    await Future.delayed(const Duration(seconds: 1));

    // Pour l'exemple, nous retournons une commande fictive
    if (orderId.startsWith('o-')) {
      return Order(
        id: orderId,
        orderNumber: 'OE2024-001',
        userId: 'u-12345',
        status: OrderStatus.confirmed,
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        updatedAt: DateTime.now().subtract(const Duration(hours: 1)),
        totalAmount: 1500,
        parcels: [_createDummyParcel('p-12345', 'CE2024-001')],
        payment: await _paymentService.getPaymentById('p-12345'),
      );
    }

    return null;
  }

  /// Obtient les commandes d'un utilisateur
  Future<List<Order>> getUserOrders(String userId) async {
    // Simulation d'un appel API
    await Future.delayed(const Duration(seconds: 1));

    // Dans une vraie application, nous interrogerions la base de donné9es
    // Pour l'exemple, nous retournons une liste de commandes fictives
    return [
      Order(
        id: 'o-12345',
        orderNumber: 'OE2024-001',
        userId: userId,
        status: OrderStatus.completed,
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        updatedAt: DateTime.now().subtract(const Duration(days: 2)),
        totalAmount: 1500,
        parcels: [_createDummyParcel('p-12345', 'CE2024-001')],
        payment: await _paymentService.getPaymentById('p-12345'),
      ),
      Order(
        id: 'o-12346',
        orderNumber: 'OE2024-002',
        userId: userId,
        status: OrderStatus.processing,
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
        updatedAt: DateTime.now().subtract(const Duration(hours: 4)),
        totalAmount: 2500,
        parcels: [_createDummyParcel('p-12346', 'CE2024-002', isExpress: true)],
        payment: await _paymentService.getPaymentById('p-12346'),
      ),
    ];
  }

  /// Met é0 jour le statut d'une commande
  Future<Order> updateOrderStatus({
    required String orderId,
    required OrderStatus newStatus,
  }) async {
    // Simulation d'un appel API
    await Future.delayed(const Duration(seconds: 1));

    // Dans une vraie application, cela mettrait é0 jour une commande existante
    final order = await getOrderById(orderId);

    if (order == null) {
      throw Exception('Commande non trouvée');
    }

    // Dans une vraie application, nous mettrions é0 jour la base de donné9es
    // Pour l'exemple, nous retournons une nouvelle commande avec le statut mis é0 jour
    return Order(
      id: order.id,
      orderNumber: order.orderNumber,
      userId: order.userId,
      status: newStatus,
      createdAt: order.createdAt,
      updatedAt: DateTime.now(),
      totalAmount: order.totalAmount,
      parcels: order.parcels,
      payment: order.payment,
    );
  }

  /// Crée un colis fictif pour les exemples
  Parcel _createDummyParcel(
    String id,
    String trackingNumber, {
    bool isExpress = false,
  }) {
    return Parcel(
      id: id,
      trackingNumber: trackingNumber,
      status: isExpress ? ParcelStatus.outForDelivery : ParcelStatus.inTransit,
      description: isExpress ? 'Matériel informatique' : 'Documents importants',
      createdAt: DateTime.now().subtract(Duration(hours: isExpress ? 5 : 2)),
      updatedAt: DateTime.now().subtract(Duration(hours: isExpress ? 3 : 1)),
      estimatedDelivery: DateTime.now().add(Duration(hours: isExpress ? 2 : 3)),
      pickupAddress: Address(
        street: 'Quartier Akpakpa',
        city: 'Cotonou',
        state: 'Littoral',
        country: 'Bénin',
        district: '',
      ),
      deliveryAddress: Address(
        street: isExpress ? 'Quartier Cadjehoun' : 'Quartier Houéyiho',
        city: 'Cotonou',
        state: 'Littoral',
        country: 'Bénin',
        district: '',
      ),
      sender: Contact(name: 'Jean Dupont', phoneNumber: '+229 97123456'),
      recipient: Contact(
        name: isExpress ? 'Jean Adjo' : 'Marie Koumako',
        phoneNumber: isExpress ? '+229 95456789' : '+229 95789012',
      ),
      price: isExpress ? 2500 : 1500,
      transportType: isExpress ? TransportType.express : TransportType.standard,
    );
  }
}
