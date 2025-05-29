/// Modu00e8le pour un contact (expu00e9diteur ou destinataire)
class Contact {
  final String name;
  final String phoneNumber;
  final String? email;

  Contact({
    required this.name,
    required this.phoneNumber,
    this.email,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name, 
      'phoneNumber': phoneNumber, 
      'email': email,
    };
  }
}
