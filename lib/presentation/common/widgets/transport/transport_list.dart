import 'package:flutter/material.dart';
import 'package:agbantche/presentation/common/widgets/transport/transport_card.dart';

class TransportList extends StatelessWidget {
  final VoidCallback onTransporteurSelected;
  const TransportList({super.key, required this.onTransporteurSelected});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> transporteurs = [
      {
        'name': 'TransExpress',
        'emoji': '🚛',
        'gradient': const LinearGradient(
          colors: [Color(0xFF10B981), Color(0xFF34D399)],
        ),
        'recommended': true,
        'rating': 4.8,
        'reviews': 127,
        'price': 2500,
        'duration': '2h',
        'type': 'Camion',
        'typeIcon': '🚛',
        'buttonGradient': const LinearGradient(
          colors: [Color(0xFF10B981), Color(0xFF34D399)],
        ),
      },
      {
        'name': 'RapidColis',
        'emoji': '🚐',
        'gradient': const LinearGradient(
          colors: [Color(0xFF3B82F6), Color(0xFF60A5FA)],
        ),
        'recommended': false,
        'rating': 4.6,
        'reviews': 89,
        'price': 2200,
        'duration': '3h',
        'type': 'Fourgon',
        'typeIcon': '🚐',
        'buttonGradient': const LinearGradient(
          colors: [Color(0xFF3B82F6), Color(0xFF60A5FA)],
        ),
      },
      {
        'name': 'MotoLivraison',
        'emoji': '🏍️',
        'gradient': const LinearGradient(
          colors: [Color(0xFFF59E0B), Color(0xFFFBBF24)],
        ),
        'recommended': false,
        'rating': 4.9,
        'reviews': 203,
        'price': 1800,
        'duration': '1h',
        'type': 'Moto',
        'typeIcon': '🏍️',
        'buttonGradient': const LinearGradient(
          colors: [Color(0xFFF59E0B), Color(0xFFFBBF24)],
        ),
      },
    ];
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: transporteurs.length,
      itemBuilder: (context, index) {
        final t = transporteurs[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TransportCard(
            name: t['name'],
            emoji: t['emoji'],
            gradient: t['gradient'],
            recommended: t['recommended'],
            rating: t['rating'],
            reviews: t['reviews'],
            price: t['price'],
            duration: t['duration'],
            type: t['type'],
            typeIcon: t['typeIcon'],
            buttonGradient: t['buttonGradient'],
            onSelected: onTransporteurSelected,
          ),
        );
      },
    );
  }
}
