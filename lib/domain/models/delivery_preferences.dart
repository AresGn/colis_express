/// Types de préférences de livraison
enum DeliveryType {
  standard,
  express,
  economy,
}

/// Créneaux horaires préférés
enum PreferredTimeSlot {
  morning,    // 8h-12h
  afternoon,  // 12h-17h
  evening,    // 17h-20h
  anytime,    // Peu importe
}

/// Modèle pour les préférences de livraison
class DeliveryPreferences {
  final DeliveryType preferredDeliveryType;
  final PreferredTimeSlot preferredTimeSlot;
  final bool allowWeekendDelivery;
  final bool requireSignature;
  final bool allowNeighborDelivery;
  final String? specialInstructions;
  final List<String> preferredTransporters;

  const DeliveryPreferences({
    this.preferredDeliveryType = DeliveryType.standard,
    this.preferredTimeSlot = PreferredTimeSlot.anytime,
    this.allowWeekendDelivery = true,
    this.requireSignature = false,
    this.allowNeighborDelivery = true,
    this.specialInstructions,
    this.preferredTransporters = const [],
  });

  DeliveryPreferences copyWith({
    DeliveryType? preferredDeliveryType,
    PreferredTimeSlot? preferredTimeSlot,
    bool? allowWeekendDelivery,
    bool? requireSignature,
    bool? allowNeighborDelivery,
    String? specialInstructions,
    List<String>? preferredTransporters,
  }) {
    return DeliveryPreferences(
      preferredDeliveryType: preferredDeliveryType ?? this.preferredDeliveryType,
      preferredTimeSlot: preferredTimeSlot ?? this.preferredTimeSlot,
      allowWeekendDelivery: allowWeekendDelivery ?? this.allowWeekendDelivery,
      requireSignature: requireSignature ?? this.requireSignature,
      allowNeighborDelivery: allowNeighborDelivery ?? this.allowNeighborDelivery,
      specialInstructions: specialInstructions ?? this.specialInstructions,
      preferredTransporters: preferredTransporters ?? this.preferredTransporters,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'preferredDeliveryType': preferredDeliveryType.name,
      'preferredTimeSlot': preferredTimeSlot.name,
      'allowWeekendDelivery': allowWeekendDelivery,
      'requireSignature': requireSignature,
      'allowNeighborDelivery': allowNeighborDelivery,
      'specialInstructions': specialInstructions,
      'preferredTransporters': preferredTransporters,
    };
  }

  factory DeliveryPreferences.fromJson(Map<String, dynamic> json) {
    return DeliveryPreferences(
      preferredDeliveryType: DeliveryType.values.firstWhere(
        (type) => type.name == json['preferredDeliveryType'],
        orElse: () => DeliveryType.standard,
      ),
      preferredTimeSlot: PreferredTimeSlot.values.firstWhere(
        (slot) => slot.name == json['preferredTimeSlot'],
        orElse: () => PreferredTimeSlot.anytime,
      ),
      allowWeekendDelivery: json['allowWeekendDelivery'] ?? true,
      requireSignature: json['requireSignature'] ?? false,
      allowNeighborDelivery: json['allowNeighborDelivery'] ?? true,
      specialInstructions: json['specialInstructions'],
      preferredTransporters: List<String>.from(json['preferredTransporters'] ?? []),
    );
  }

  /// Méthodes utilitaires pour l'affichage
  String get deliveryTypeDisplayName {
    switch (preferredDeliveryType) {
      case DeliveryType.standard:
        return 'Livraison standard';
      case DeliveryType.express:
        return 'Livraison express';
      case DeliveryType.economy:
        return 'Livraison économique';
    }
  }

  String get timeSlotDisplayName {
    switch (preferredTimeSlot) {
      case PreferredTimeSlot.morning:
        return 'Matin (8h-12h)';
      case PreferredTimeSlot.afternoon:
        return 'Après-midi (12h-17h)';
      case PreferredTimeSlot.evening:
        return 'Soir (17h-20h)';
      case PreferredTimeSlot.anytime:
        return 'Peu importe';
    }
  }

  /// Valeurs par défaut recommandées
  static const DeliveryPreferences defaultPreferences = DeliveryPreferences(
    preferredDeliveryType: DeliveryType.standard,
    preferredTimeSlot: PreferredTimeSlot.anytime,
    allowWeekendDelivery: true,
    requireSignature: false,
    allowNeighborDelivery: true,
  );
}
