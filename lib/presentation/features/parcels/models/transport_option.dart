import 'package:flutter/material.dart';

/// Modèle de données pour les options de transport
class TransportOption {
  final String name;
  final int price;
  final String deliveryTime;
  final IconData icon;
  final Color iconColor;

  TransportOption({
    required this.name,
    required this.price,
    required this.deliveryTime,
    required this.icon,
    required this.iconColor,
  });
}
