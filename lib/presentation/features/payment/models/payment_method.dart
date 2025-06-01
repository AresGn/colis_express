import 'package:flutter/material.dart';

/// Modé8le de mé9thode de paiement
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
