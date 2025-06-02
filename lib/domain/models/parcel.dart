import 'package:agbantche/domain/models/address.dart';
import 'package:agbantche/domain/models/contact.dart';
import 'package:agbantche/domain/models/parcel_history_entry.dart';
import 'package:agbantche/domain/models/parcel_status.dart';
import 'package:agbantche/domain/models/transport_type.dart';

/// Modé8le de donné9es pour un colis
class Parcel {
  final String id;
  final String trackingNumber;
  final ParcelStatus status;
  final String description;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? estimatedDelivery;
  final DateTime? deliveryDate;
  final Address pickupAddress;
  final Address deliveryAddress;
  final Contact sender;
  final Contact recipient;
  final double? weight;
  final String? dimensions;
  final double price;
  final TransportType transportType;
  final List<ParcelHistoryEntry>? history;

  Parcel({
    required this.id,
    required this.trackingNumber,
    required this.status,
    required this.description,
    required this.createdAt,
    this.updatedAt,
    this.estimatedDelivery,
    this.deliveryDate,
    required this.pickupAddress,
    required this.deliveryAddress,
    required this.sender,
    required this.recipient,
    this.weight,
    this.dimensions,
    required this.price,
    required this.transportType,
    this.history,
  });

  /// Factory pour cré9er un objet Parcel é0 partir d'un JSON
  factory Parcel.fromJson(Map<String, dynamic> json) {
    return Parcel(
      id: json['id'],
      trackingNumber: json['trackingNumber'],
      status: ParcelStatus.values.byName(json['status']),
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      estimatedDelivery:
          json['estimatedDelivery'] != null
              ? DateTime.parse(json['estimatedDelivery'])
              : null,
      deliveryDate:
          json['deliveryDate'] != null
              ? DateTime.parse(json['deliveryDate'])
              : null,
      pickupAddress: Address.fromJson(json['pickupAddress']),
      deliveryAddress: Address.fromJson(json['deliveryAddress']),
      sender: Contact.fromJson(json['sender']),
      recipient: Contact.fromJson(json['recipient']),
      weight: json['weight'],
      dimensions: json['dimensions'],
      price: json['price'].toDouble(),
      transportType: TransportType.values.byName(json['transportType']),
      history:
          json['history'] != null
              ? (json['history'] as List)
                  .map((entry) => ParcelHistoryEntry.fromJson(entry))
                  .toList()
              : null,
    );
  }

  /// Convertit l'objet Parcel en JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'trackingNumber': trackingNumber,
      'status': status.name,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'estimatedDelivery': estimatedDelivery?.toIso8601String(),
      'deliveryDate': deliveryDate?.toIso8601String(),
      'pickupAddress': pickupAddress.toJson(),
      'deliveryAddress': deliveryAddress.toJson(),
      'sender': sender.toJson(),
      'recipient': recipient.toJson(),
      'weight': weight,
      'dimensions': dimensions,
      'price': price,
      'transportType': transportType.name,
      'history': history?.map((entry) => entry.toJson()).toList(),
    };
  }
}
