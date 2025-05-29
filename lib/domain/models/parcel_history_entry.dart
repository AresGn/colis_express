/// Modu00e8le pour les entru00e9es d'historique d'un colis
class ParcelHistoryEntry {
  final DateTime timestamp;
  final String status;
  final String description;
  final String? location;

  ParcelHistoryEntry({
    required this.timestamp,
    required this.status,
    required this.description,
    this.location,
  });

  factory ParcelHistoryEntry.fromJson(Map<String, dynamic> json) {
    return ParcelHistoryEntry(
      timestamp: DateTime.parse(json['timestamp']),
      status: json['status'],
      description: json['description'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp.toIso8601String(),
      'status': status,
      'description': description,
      'location': location,
    };
  }
}
