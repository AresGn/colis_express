/// Modu00e8le de donnu00e9es pour un utilisateur
class User {
  final String id;
  final String name;
  final String phoneNumber;
  final String? email;
  final String? profileImageUrl;
  final UserRole role;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? lastLogin;
  final List<Address>? savedAddresses;

  User({
    required this.id,
    required this.name,
    required this.phoneNumber,
    this.email,
    this.profileImageUrl,
    required this.role,
    required this.isActive,
    required this.createdAt,
    this.lastLogin,
    this.savedAddresses,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      profileImageUrl: json['profileImageUrl'],
      role: UserRole.values.byName(json['role']),
      isActive: json['isActive'],
      createdAt: DateTime.parse(json['createdAt']),
      lastLogin: json['lastLogin'] != null ? DateTime.parse(json['lastLogin']) : null,
      savedAddresses: json['savedAddresses'] != null
          ? (json['savedAddresses'] as List)
              .map((e) => Address.fromJson(e))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'profileImageUrl': profileImageUrl,
      'role': role.name,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'lastLogin': lastLogin?.toIso8601String(),
      'savedAddresses': savedAddresses?.map((e) => e.toJson()).toList(),
    };
  }
}

/// Ru00f4les possibles pour un utilisateur
enum UserRole {
  customer,     // Client
  transporter,  // Transporteur
  admin,        // Administrateur
}

/// Modu00e8le pour une adresse
class Address {
  final String id;
  final String label;  // Ex: "Domicile", "Bureau"
  final String street;
  final String city;
  final String state;
  final String country;
  final String? postalCode;
  final bool isDefault;
  final double? latitude;
  final double? longitude;

  Address({
    required this.id,
    required this.label,
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    this.postalCode,
    required this.isDefault,
    this.latitude,
    this.longitude,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      label: json['label'],
      street: json['street'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postalCode: json['postalCode'],
      isDefault: json['isDefault'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'street': street,
      'city': city,
      'state': state,
      'country': country,
      'postalCode': postalCode,
      'isDefault': isDefault,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  String toString() {
    return '$street, $city, $state, $country';
  }
}
