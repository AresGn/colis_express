import 'delivery_preferences.dart';
import 'notification_preferences.dart';

/// Modèle pour les données d'intégration utilisateur
class UserSetupData {
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? email;
  final List<UserAddress> addresses;
  final List<String> contactIds;
  final DeliveryPreferences? deliveryPreferences;
  final NotificationPreferences? notificationPreferences;
  final bool isSetupComplete;

  const UserSetupData({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.addresses = const [],
    this.contactIds = const [],
    this.deliveryPreferences,
    this.notificationPreferences,
    this.isSetupComplete = false,
  });

  UserSetupData copyWith({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
    List<UserAddress>? addresses,
    List<String>? contactIds,
    DeliveryPreferences? deliveryPreferences,
    NotificationPreferences? notificationPreferences,
    bool? isSetupComplete,
  }) {
    return UserSetupData(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      addresses: addresses ?? this.addresses,
      contactIds: contactIds ?? this.contactIds,
      deliveryPreferences: deliveryPreferences ?? this.deliveryPreferences,
      notificationPreferences:
          notificationPreferences ?? this.notificationPreferences,
      isSetupComplete: isSetupComplete ?? this.isSetupComplete,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'addresses': addresses.map((address) => address.toJson()).toList(),
      'contactIds': contactIds,
      'deliveryPreferences': deliveryPreferences?.toJson(),
      'notificationPreferences': notificationPreferences?.toJson(),
      'isSetupComplete': isSetupComplete,
    };
  }

  factory UserSetupData.fromJson(Map<String, dynamic> json) {
    return UserSetupData(
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      addresses:
          (json['addresses'] as List<dynamic>?)
              ?.map((address) => UserAddress.fromJson(address))
              .toList() ??
          [],
      contactIds: List<String>.from(json['contactIds'] ?? []),
      deliveryPreferences:
          json['deliveryPreferences'] != null
              ? DeliveryPreferences.fromJson(json['deliveryPreferences'])
              : null,
      notificationPreferences:
          json['notificationPreferences'] != null
              ? NotificationPreferences.fromJson(
                json['notificationPreferences'],
              )
              : null,
      isSetupComplete: json['isSetupComplete'] ?? false,
    );
  }
}

/// Modèle pour les adresses utilisateur
class UserAddress {
  final String id;
  final String label;
  final String fullAddress;
  final String? city;
  final String? district;
  final String? landmark;
  final bool isDefault;
  final DateTime createdAt;

  const UserAddress({
    required this.id,
    required this.label,
    required this.fullAddress,
    this.city,
    this.district,
    this.landmark,
    this.isDefault = false,
    required this.createdAt,
  });

  UserAddress copyWith({
    String? id,
    String? label,
    String? fullAddress,
    String? city,
    String? district,
    String? landmark,
    bool? isDefault,
    DateTime? createdAt,
  }) {
    return UserAddress(
      id: id ?? this.id,
      label: label ?? this.label,
      fullAddress: fullAddress ?? this.fullAddress,
      city: city ?? this.city,
      district: district ?? this.district,
      landmark: landmark ?? this.landmark,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'fullAddress': fullAddress,
      'city': city,
      'district': district,
      'landmark': landmark,
      'isDefault': isDefault,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory UserAddress.fromJson(Map<String, dynamic> json) {
    return UserAddress(
      id: json['id'],
      label: json['label'],
      fullAddress: json['fullAddress'],
      city: json['city'],
      district: json['district'],
      landmark: json['landmark'],
      isDefault: json['isDefault'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
