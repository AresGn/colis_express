import 'package:flutter/material.dart';

class HomeRecentParcels extends StatelessWidget {
  const HomeRecentParcels({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Colis récents',
              style: TextStyle(
                color: Color(0xFF1F2937),
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            _ParcelItem(
              emoji: '📦',
              gradient: const LinearGradient(
                colors: [Color(0xFF10B981), Color(0xFF34D399)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              id: '#CE2024-001',
              detail: 'Vers Parakou • Livré',
              status: '✓ Livré',
              statusColor: Color(0xFF10B981),
              statusIcon: null,
            ),
            const SizedBox(height: 12),
            _ParcelItem(
              emoji: '📦',
              gradient: const LinearGradient(
                colors: [Color(0xFF3B82F6), Color(0xFF60A5FA)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              id: '#CE2024-002',
              detail: 'Vers Abomey • En transit',
              status: '🚚 Transit',
              statusColor: Color(0xFF3B82F6),
              statusIcon: null,
            ),
          ],
        ),
      ),
    );
  }
}

class _ParcelItem extends StatelessWidget {
  final String emoji;
  final LinearGradient gradient;
  final String id;
  final String detail;
  final String status;
  final Color statusColor;
  final IconData? statusIcon;

  const _ParcelItem({
    required this.emoji,
    required this.gradient,
    required this.id,
    required this.detail,
    required this.status,
    required this.statusColor,
    this.statusIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(emoji, style: const TextStyle(fontSize: 24)),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                id,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                detail,
                style: const TextStyle(color: Color(0xFF6B7280), fontSize: 13),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Text(
          status,
          style: TextStyle(
            color: statusColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
