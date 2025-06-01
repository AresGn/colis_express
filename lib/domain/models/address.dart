/// Modé8le pour une adresse
class Address {
  final String street;
  final String city;
  final String state;
  final String country;
  final String? postalCode;
  final double? latitude;
  final double? longitude;
  final String? district;

  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    this.postalCode,
    this.latitude,
    this.longitude,
    this.district = '',
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postalCode: json['postalCode'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      district: json['district'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'country': country,
      'postalCode': postalCode,
      'latitude': latitude,
      'longitude': longitude,
      'district': district,
    };
  }

  @override
  String toString() {
    final parts = <String>[street, city, state, country];
    return parts.where((part) => part.isNotEmpty).join(', ');
  }
}
