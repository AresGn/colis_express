import 'package:flutter/material.dart';

/// Modu00e8le de mu00e9thode de paiement
class PaymentMethod {
  final int id;
  final String name;
  final IconData icon;
  final bool requiresForm;

  PaymentMethod({
    required this.id,
    required this.name,
    required this.icon,
    required this.requiresForm,
  });
}
