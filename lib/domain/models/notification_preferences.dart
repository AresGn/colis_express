/// Types de notifications disponibles
enum NotificationType {
  orderConfirmation,
  pickupReady,
  inTransit,
  nearDelivery,
  delivered,
  paymentConfirmation,
  promotions,
  systemUpdates,
}

/// Canaux de notification
enum NotificationChannel {
  push,
  sms,
  email,
}

/// Modèle pour les préférences de notification
class NotificationPreferences {
  final Map<NotificationType, List<NotificationChannel>> preferences;
  final bool enableSounds;
  final bool enableVibration;
  final String? quietHoursStart; // Format HH:mm
  final String? quietHoursEnd;   // Format HH:mm
  final bool enableQuietHours;

  const NotificationPreferences({
    this.preferences = const {},
    this.enableSounds = true,
    this.enableVibration = true,
    this.quietHoursStart,
    this.quietHoursEnd,
    this.enableQuietHours = false,
  });

  NotificationPreferences copyWith({
    Map<NotificationType, List<NotificationChannel>>? preferences,
    bool? enableSounds,
    bool? enableVibration,
    String? quietHoursStart,
    String? quietHoursEnd,
    bool? enableQuietHours,
  }) {
    return NotificationPreferences(
      preferences: preferences ?? this.preferences,
      enableSounds: enableSounds ?? this.enableSounds,
      enableVibration: enableVibration ?? this.enableVibration,
      quietHoursStart: quietHoursStart ?? this.quietHoursStart,
      quietHoursEnd: quietHoursEnd ?? this.quietHoursEnd,
      enableQuietHours: enableQuietHours ?? this.enableQuietHours,
    );
  }

  /// Vérifie si un type de notification est activé pour un canal donné
  bool isNotificationEnabled(NotificationType type, NotificationChannel channel) {
    return preferences[type]?.contains(channel) ?? false;
  }

  /// Active ou désactive une notification pour un canal donné
  NotificationPreferences toggleNotification(
    NotificationType type,
    NotificationChannel channel,
    bool enabled,
  ) {
    final newPreferences = Map<NotificationType, List<NotificationChannel>>.from(preferences);
    
    if (!newPreferences.containsKey(type)) {
      newPreferences[type] = [];
    }

    final channels = List<NotificationChannel>.from(newPreferences[type]!);
    
    if (enabled && !channels.contains(channel)) {
      channels.add(channel);
    } else if (!enabled && channels.contains(channel)) {
      channels.remove(channel);
    }

    newPreferences[type] = channels;
    
    return copyWith(preferences: newPreferences);
  }

  Map<String, dynamic> toJson() {
    final preferencesJson = <String, List<String>>{};
    preferences.forEach((type, channels) {
      preferencesJson[type.name] = channels.map((channel) => channel.name).toList();
    });

    return {
      'preferences': preferencesJson,
      'enableSounds': enableSounds,
      'enableVibration': enableVibration,
      'quietHoursStart': quietHoursStart,
      'quietHoursEnd': quietHoursEnd,
      'enableQuietHours': enableQuietHours,
    };
  }

  factory NotificationPreferences.fromJson(Map<String, dynamic> json) {
    final preferencesMap = <NotificationType, List<NotificationChannel>>{};
    
    if (json['preferences'] != null) {
      final preferencesJson = Map<String, dynamic>.from(json['preferences']);
      preferencesJson.forEach((typeString, channelsJson) {
        final type = NotificationType.values.firstWhere(
          (t) => t.name == typeString,
          orElse: () => NotificationType.orderConfirmation,
        );
        
        final channels = (channelsJson as List<dynamic>)
            .map((channelString) => NotificationChannel.values.firstWhere(
                  (c) => c.name == channelString,
                  orElse: () => NotificationChannel.push,
                ))
            .toList();
        
        preferencesMap[type] = channels;
      });
    }

    return NotificationPreferences(
      preferences: preferencesMap,
      enableSounds: json['enableSounds'] ?? true,
      enableVibration: json['enableVibration'] ?? true,
      quietHoursStart: json['quietHoursStart'],
      quietHoursEnd: json['quietHoursEnd'],
      enableQuietHours: json['enableQuietHours'] ?? false,
    );
  }

  /// Méthodes utilitaires pour l'affichage
  String getNotificationTypeDisplayName(NotificationType type) {
    switch (type) {
      case NotificationType.orderConfirmation:
        return 'Confirmation de commande';
      case NotificationType.pickupReady:
        return 'Prêt pour collecte';
      case NotificationType.inTransit:
        return 'En transit';
      case NotificationType.nearDelivery:
        return 'Proche de la livraison';
      case NotificationType.delivered:
        return 'Livré';
      case NotificationType.paymentConfirmation:
        return 'Confirmation de paiement';
      case NotificationType.promotions:
        return 'Promotions';
      case NotificationType.systemUpdates:
        return 'Mises à jour système';
    }
  }

  String getChannelDisplayName(NotificationChannel channel) {
    switch (channel) {
      case NotificationChannel.push:
        return 'Notification push';
      case NotificationChannel.sms:
        return 'SMS';
      case NotificationChannel.email:
        return 'Email';
    }
  }

  /// Préférences par défaut recommandées
  static final NotificationPreferences defaultPreferences = NotificationPreferences(
    preferences: {
      NotificationType.orderConfirmation: [NotificationChannel.push, NotificationChannel.sms],
      NotificationType.pickupReady: [NotificationChannel.push],
      NotificationType.inTransit: [NotificationChannel.push],
      NotificationType.nearDelivery: [NotificationChannel.push, NotificationChannel.sms],
      NotificationType.delivered: [NotificationChannel.push, NotificationChannel.sms],
      NotificationType.paymentConfirmation: [NotificationChannel.push],
      NotificationType.promotions: [NotificationChannel.push],
      NotificationType.systemUpdates: [NotificationChannel.push],
    },
    enableSounds: true,
    enableVibration: true,
    enableQuietHours: false,
  );
}
