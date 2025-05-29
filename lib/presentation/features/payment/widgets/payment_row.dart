import 'package:flutter/material.dart';

class PaymentRow extends StatelessWidget {
  final String label;
  final String amount;
  final bool isTotal;

  const PaymentRow({
    Key? key,
    required this.label,
    required this.amount,
    this.isTotal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              color: isTotal
                  ? const Color(0xFF1F2937) // Dark for total
                  : const Color(0xFF6B7280), // Grey for items
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 15 : 14,
              color: isTotal
                  ? const Color(0xFF1F2937) // Dark for total
                  : const Color(0xFF6B7280), // Grey for items
            ),
          ),
        ],
      ),
    );
  }
}
