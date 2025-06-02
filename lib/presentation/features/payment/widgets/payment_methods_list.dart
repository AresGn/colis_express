import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/theme/app_typography.dart';
import 'package:agbantche/presentation/features/payment/models/payment_method.dart';

class PaymentMethodsList extends StatelessWidget {
  final List<PaymentMethod> paymentMethods;
  final int selectedPaymentMethodId;
  final Function(int) onPaymentMethodSelected;

  const PaymentMethodsList({
    Key? key,
    required this.paymentMethods,
    required this.selectedPaymentMethodId,
    required this.onPaymentMethodSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Mé9thode de paiement', style: AppTypography.h3),
        const SizedBox(height: 16),
        ...paymentMethods
            .map((method) => _buildPaymentMethodTile(context, method))
            .toList(),
      ],
    );
  }

  Widget _buildPaymentMethodTile(BuildContext context, PaymentMethod method) {
    final bool isSelected = method.id == selectedPaymentMethodId;

    // Déterminer les couleurs de l'icône en fonction de la méthode de paiement
    List<Color> iconColors;

    switch (method.id) {
      case 0: // Carte de crédit
        iconColors = [AppColors.primaryRed, AppColors.primaryBlue];
        break;
      case 1: // Mobile Money
        iconColors = [Colors.orange, Colors.deepOrange];
        break;
      case 2: // Paiement à la livraison
        iconColors = [
          AppColors.primaryGreen,
          AppColors.primaryGreen.withValues(alpha: 0.7),
        ];
        break;
      default:
        iconColors = [AppColors.primaryRed, AppColors.primaryBlue];
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onPaymentMethodSelected(method.id),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                color:
                    isSelected ? AppColors.primaryRed : AppColors.borderLight,
                width: isSelected ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                // Icône avec gradient
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: iconColors,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(method.icon, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 16),

                // Nom de la méthode
                Expanded(
                  child: Text(
                    method.name,
                    style: AppTypography.body1.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                // Radio button
                Radio<int>(
                  value: method.id,
                  groupValue: selectedPaymentMethodId,
                  onChanged: (int? value) {
                    if (value != null) {
                      onPaymentMethodSelected(value);
                    }
                  },
                  activeColor: AppColors.primaryGreen,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
