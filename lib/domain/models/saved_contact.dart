/// Modèle pour un contact sauvegardé
class SavedContact {
  final String id;
  final String name;
  final String phoneNumber;
  final String? email;
  final String address;
  final String? label; // Ex: "Famille", "Travail", "Ami"
  final bool isDefault;
  final DateTime createdAt;
  final DateTime? updatedAt;

  SavedContact({
    required this.id,
    required this.name,
    required this.phoneNumber,
    this.email,
    required this.address,
    this.label,
    this.isDefault = false,
    required this.createdAt,
    this.updatedAt,
  });

  factory SavedContact.fromJson(Map<String, dynamic> json) {
    return SavedContact(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      address: json['address'],
      label: json['label'],
      isDefault: json['isDefault'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null 
          ? DateTime.parse(json['updatedAt']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'address': address,
      'label': label,
      'isDefault': isDefault,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  SavedContact copyWith({
    String? id,
    String? name,
    String? phoneNumber,
    String? email,
    String? address,
    String? label,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SavedContact(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      address: address ?? this.address,
      label: label ?? this.label,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'SavedContact(id: $id, name: $name, phoneNumber: $phoneNumber, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SavedContact && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
