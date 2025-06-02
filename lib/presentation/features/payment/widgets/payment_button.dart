import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/theme/app_typography.dart';
import 'package:agbantche/presentation/core/widgets/custom_button.dart';

class PaymentButton extends StatelessWidget {
  final double amount;
  final VoidCallback onPressed;
  final bool isLoading;

  const PaymentButton({
    Key? key,
    required this.amount,
    required this.onPressed,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, -1),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Texte de sécurité
          Text(
            'Vos données de paiement sont sécurisées',
            style: AppTypography.caption.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Bouton de paiement
          CustomButton(
            text: 'Payer ${amount.toStringAsFixed(0)} FCFA',
            icon: Icons.lock,
            onPressed: onPressed,
            isLoading: isLoading,
            variant: ButtonVariant.primary,
            size: ButtonSize.large,
          ),
        ],
      ),
    );
  }
}
