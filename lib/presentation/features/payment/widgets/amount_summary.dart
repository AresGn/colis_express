import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/theme/app_typography.dart';

class AmountSummary extends StatelessWidget {
  final double amount;

  const AmountSummary({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double shipping = 500; // Frais de livraison fixe
    final double subtotal = amount - shipping; // Montant sans livraison

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Résumé de la commande', style: AppTypography.h3),
          const SizedBox(height: 16),

          // Détails du montant
          _buildPaymentRow('Sous-total', '${subtotal.toStringAsFixed(0)} FCFA'),
          _buildPaymentRow(
            'Frais de livraison',
            '${shipping.toStringAsFixed(0)} FCFA',
          ),
          const Divider(height: 24),
          _buildPaymentRow(
            'Total',
            '${amount.toStringAsFixed(0)} FCFA',
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentRow(String label, String amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 15 : 14,
              color:
                  isTotal
                      ? const Color(0xFF1F2937) // Dark for total
                      : const Color(0xFF6B7280), // Grey for items
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 15 : 14,
              color:
                  isTotal
                      ? const Color(0xFF1F2937) // Dark for total
                      : const Color(0xFF6B7280), // Grey for items
            ),
          ),
        ],
      ),
    );
  }
}
