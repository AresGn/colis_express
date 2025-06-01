import 'package:flutter/material.dart';

/// Modèle de données pour un transporteur
class Transporter {
  final String id;
  final String name;
  final String logo; // Emoji ou URL d'image
  final bool isRecommended;
  final double rating;
  final int reviewCount;
  final int price; // Prix en FCFA
  final String estimatedTime;
  final String vehicleType; // Ex: "Camion", "Fourgon", "Moto"
  final String vehicleIcon; // Emoji du véhicule
  final Color primaryColor;
  final Color secondaryColor;

  Transporter({
    required this.id,
    required this.name,
    required this.logo,
    this.isRecommended = false,
    required this.rating,
    required this.reviewCount,
    required this.price,
    required this.estimatedTime,
    required this.vehicleType,
    required this.vehicleIcon,
    required this.primaryColor,
    required this.secondaryColor,
  });

  factory Transporter.fromJson(Map<String, dynamic> json) {
    return Transporter(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
      isRecommended: json['isRecommended'] ?? false,
      rating: json['rating'].toDouble(),
      reviewCount: json['reviewCount'],
      price: json['price'],
      estimatedTime: json['estimatedTime'],
      vehicleType: json['vehicleType'],
      vehicleIcon: json['vehicleIcon'],
      primaryColor: Color(json['primaryColor']),
      secondaryColor: Color(json['secondaryColor']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'isRecommended': isRecommended,
      'rating': rating,
      'reviewCount': reviewCount,
      'price': price,
      'estimatedTime': estimatedTime,
      'vehicleType': vehicleType,
      'vehicleIcon': vehicleIcon,
      'primaryColor': primaryColor.value,
      'secondaryColor': secondaryColor.value,
    };
  }
}
