import 'package:agbantche/domain/models/order.dart';

/// Service responsable de la gestion des paiements
class PaymentService {
  // Singleton pattern
  static final PaymentService _instance = PaymentService._internal();

  factory PaymentService() {
    return _instance;
  }

  PaymentService._internal();

  /// Effectue un paiement pour une commande
  Future<Payment> processPayment({
    required String orderId,
    required PaymentMethod method,
    required double amount,
    Map<String, dynamic>? additionalData,
  }) async {
    // Simulation d'un appel API
    await Future.delayed(const Duration(seconds: 2));

    // Gé9né9rer un ID unique et un numé9ro de transaction
    final id = 'p-${DateTime.now().millisecondsSinceEpoch}';
    final transactionId = 'TX${DateTime.now().year}${_getRandomNumber(6)}';

    // Cré9er et retourner un nouveau paiement
    return Payment(
      id: id,
      orderId: orderId,
      transactionId: transactionId,
      method: method,
      status:
          PaymentStatus
              .completed, // Pour l'exemple, on suppose que le paiement ré9ussit toujours
      amount: amount,
      createdAt: DateTime.now(),
      completedAt: DateTime.now(),
      additionalData: additionalData,
    );
  }

  /// Obtient les dé9tails d'un paiement
  Future<Payment?> getPaymentById(String paymentId) async {
    // Simulation d'un appel API
    await Future.delayed(const Duration(milliseconds: 800));

    // Dans une vraie application, nous interrogerions la base de donné9es
    // Pour l'exemple, nous retournons un paiement fictif si l'ID commence par 'p-'
    if (paymentId.startsWith('p-')) {
      return Payment(
        id: paymentId,
        orderId: 'o-12345',
        transactionId: 'TX20241234567',
        method: PaymentMethod.card,
        status: PaymentStatus.completed,
        amount: 1500,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        completedAt: DateTime.now().subtract(const Duration(days: 1)),
      );
    }

    return null;
  }

  /// Obtient l'historique des paiements d'un utilisateur
  Future<List<Payment>> getUserPayments(String userId) async {
    // Simulation d'un appel API
    await Future.delayed(const Duration(seconds: 1));

    // Dans une vraie application, nous interrogerions la base de donné9es
    // Pour l'exemple, nous retournons une liste de paiements fictifs
    return [
      Payment(
        id: 'p-12345',
        orderId: 'o-12345',
        transactionId: 'TX20241234567',
        method: PaymentMethod.card,
        status: PaymentStatus.completed,
        amount: 1500,
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        completedAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
      Payment(
        id: 'p-12346',
        orderId: 'o-12346',
        transactionId: 'TX20249876543',
        method: PaymentMethod.mobileMoney,
        status: PaymentStatus.completed,
        amount: 2500,
        createdAt: DateTime.now().subtract(const Duration(hours: 4)),
        completedAt: DateTime.now().subtract(const Duration(hours: 4)),
      ),
    ];
  }

  // Mé9thode auxiliaire pour gé9né9rer un numé9ro alé9atoire
  String _getRandomNumber(int digits) {
    String result = '';
    for (int i = 0; i < digits; i++) {
      result += (DateTime.now().millisecondsSinceEpoch % 10).toString();
    }
    return result;
  }
}
