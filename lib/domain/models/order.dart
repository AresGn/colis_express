import 'package:benin_express/domain/models/parcel.dart';

/// Statuts possibles pour une commande
enum OrderStatus {
  pending,    // En attente de paiement
  confirmed,  // Confirmu00e9e et payu00e9e
  processing, // En cours de traitement
  cancelled,  // Annulu00e9e
  completed,  // Terminu00e9e (livru00e9e)
  refunded,   // Remboursu00e9e
}

/// Extension pour le statut de commande
extension OrderStatusExtension on OrderStatus {
  String get displayName {
    switch (this) {
      case OrderStatus.pending:
        return 'En attente';
      case OrderStatus.confirmed:
        return 'Confirmu00e9e';
      case OrderStatus.processing:
        return 'En traitement';
      case OrderStatus.cancelled:
        return 'Annulu00e9e';
      case OrderStatus.completed:
        return 'Terminu00e9e';
      case OrderStatus.refunded:
        return 'Remboursu00e9e';
    }
  }
}

/// Modu00e8le pour une commande
class Order {
  final String id;
  final String orderNumber;
  final String userId;
  final OrderStatus status;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final double totalAmount;
  final List<Parcel> parcels;
  final Payment? payment;
  
  Order({
    required this.id,
    required this.orderNumber,
    required this.userId,
    required this.status,
    required this.createdAt,
    this.updatedAt,
    required this.totalAmount,
    required this.parcels,
    this.payment,
  });
  
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      orderNumber: json['orderNumber'],
      userId: json['userId'],
      status: OrderStatus.values.byName(json['status']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      totalAmount: json['totalAmount'].toDouble(),
      parcels: (json['parcels'] as List).map((e) => Parcel.fromJson(e)).toList(),
      payment: json['payment'] != null ? Payment.fromJson(json['payment']) : null,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderNumber': orderNumber,
      'userId': userId,
      'status': status.name,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'totalAmount': totalAmount,
      'parcels': parcels.map((e) => e.toJson()).toList(),
      'payment': payment?.toJson(),
    };
  }
}

/// Mu00e9thodes de paiement disponibles
enum PaymentMethod {
  card,           // Carte de cru00e9dit/du00e9bit
  mobileMoney,    // Mobile Money
  cashOnDelivery, // Paiement u00e0 la livraison
}

/// Extension pour les mu00e9thodes de paiement
extension PaymentMethodExtension on PaymentMethod {
  String get displayName {
    switch (this) {
      case PaymentMethod.card:
        return 'Carte de cru00e9dit/du00e9bit';
      case PaymentMethod.mobileMoney:
        return 'Mobile Money';
      case PaymentMethod.cashOnDelivery:
        return 'Paiement u00e0 la livraison';
    }
  }
}

/// Statuts possibles pour un paiement
enum PaymentStatus {
  pending,    // En attente
  processing, // En cours de traitement
  completed,  // Terminu00e9
  failed,     // u00c9chouu00e9
  refunded,   // Remboursu00e9
}

/// Extension pour le statut de paiement
extension PaymentStatusExtension on PaymentStatus {
  String get displayName {
    switch (this) {
      case PaymentStatus.pending:
        return 'En attente';
      case PaymentStatus.processing:
        return 'En traitement';
      case PaymentStatus.completed:
        return 'Terminu00e9';
      case PaymentStatus.failed:
        return 'u00c9chouu00e9';
      case PaymentStatus.refunded:
        return 'Remboursu00e9';
    }
  }
}

/// Modu00e8le pour un paiement
class Payment {
  final String id;
  final String orderId;
  final String transactionId;
  final PaymentMethod method;
  final PaymentStatus status;
  final double amount;
  final DateTime createdAt;
  final DateTime? completedAt;
  final Map<String, dynamic>? additionalData; // Donnu00e9es spu00e9cifiques u00e0 la mu00e9thode de paiement
  
  Payment({
    required this.id,
    required this.orderId,
    required this.transactionId,
    required this.method,
    required this.status,
    required this.amount,
    required this.createdAt,
    this.completedAt,
    this.additionalData,
  });
  
  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      orderId: json['orderId'],
      transactionId: json['transactionId'],
      method: PaymentMethod.values.byName(json['method']),
      status: PaymentStatus.values.byName(json['status']),
      amount: json['amount'].toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
      completedAt: json['completedAt'] != null ? DateTime.parse(json['completedAt']) : null,
      additionalData: json['additionalData'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderId': orderId,
      'transactionId': transactionId,
      'method': method.name,
      'status': status.name,
      'amount': amount,
      'createdAt': createdAt.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
      'additionalData': additionalData,
    };
  }
}
