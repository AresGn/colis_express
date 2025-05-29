import 'package:benin_express/presentation/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_colors.dart';
import 'package:benin_express/presentation/core/theme/app_typography.dart';
import 'package:benin_express/presentation/core/widgets/custom_button.dart';
import 'package:benin_express/presentation/features/auth/widgets/user_type_selector.dart'
    show UserType;

/// Écran de confirmation après un paiement réussi
class PaymentConfirmationScreen extends StatelessWidget {
  final double amount;
  final String orderId;
  final String paymentMethod;
  final UserType userType;

  const PaymentConfirmationScreen({
    super.key,
    required this.amount,
    required this.orderId,
    required this.paymentMethod,
    required this.userType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animation de succès
                _buildSuccessAnimation(),
                const SizedBox(height: 40),

                // Titre et message
                Text(
                  'Paiement réussi!',
                  style: AppTypography.h1.copyWith(
                    color: AppColors.primaryGreen,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Votre paiement de ${amount.toStringAsFixed(0)} FCFA a été traité avec succès.',
                  style: AppTypography.body1.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // Détails de la transaction
                _buildTransactionDetails(),
                const SizedBox(height: 40),

                // Boutons d'action
                CustomButton(
                  text: 'Retour à l\'accueil',
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(userType: userType),
                      ),
                      (route) => false,
                    );
                  },
                  variant: ButtonVariant.primary,
                  size: ButtonSize.large,
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: 'Voir les détails de la commande',
                  onPressed: () {
                    // TODO: Naviguer vers l'écran de détails de commande
                    Navigator.of(context).pop();
                  },
                  variant: ButtonVariant.outline,
                  size: ButtonSize.large,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessAnimation() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.primaryGreen.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.check_circle,
        color: AppColors.primaryGreen,
        size: 80,
      ),
    );
  }

  Widget _buildTransactionDetails() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildDetailRow('Numéro de commande:', orderId),
          const SizedBox(height: 12),
          _buildDetailRow('Montant:', '${amount.toStringAsFixed(0)} FCFA'),
          const SizedBox(height: 12),
          _buildDetailRow('Méthode de paiement:', paymentMethod),
          const SizedBox(height: 12),
          _buildDetailRow('Date:', _getCurrentDate()),
          const SizedBox(height: 12),
          _buildDetailRow('Statut:', 'Confirmé'),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
        ),
        Text(
          value,
          style: AppTypography.body1.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  String _getCurrentDate() {
    final now = DateTime.now();
    final day = now.day.toString().padLeft(2, '0');
    final month = now.month.toString().padLeft(2, '0');
    final year = now.year.toString();
    return '$day/$month/$year';
  }
}
