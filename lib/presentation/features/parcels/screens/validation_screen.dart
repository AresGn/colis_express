import 'package:flutter/material.dart';
import 'package:agbantche/domain/models/parcel.dart';
import 'package:agbantche/domain/models/address.dart';
import 'package:agbantche/domain/models/transport_type.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/theme/app_typography.dart';
import 'package:agbantche/presentation/core/widgets/custom_button.dart';
import 'package:agbantche/presentation/core/widgets/screen_header.dart';
import 'package:agbantche/presentation/features/parcels/screens/confirmation_screen.dart';

class ValidationScreen extends StatelessWidget {
  final Parcel parcel;

  const ValidationScreen({super.key, required this.parcel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // En-tête
            ScreenHeader(
              title: 'Validation',
              subtitle: 'Vérifier les informations',
              onBackPressed: () => Navigator.of(context).pop(),
            ),

            // Contenu
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Détails du colis
                    _buildParcelDetailsSection(),
                    const SizedBox(height: 24),

                    // Adresses
                    _buildAddressSection(),
                    const SizedBox(height: 24),

                    // Type de transport
                    _buildTransportSection(),
                    const SizedBox(height: 24),

                    // Prix
                    _buildPriceSection(),
                    const SizedBox(height: 32),

                    // Bouton de confirmation
                    CustomButton(
                      text: 'Confirmer et payer',
                      onPressed: () => _confirmAndPay(context),
                      isFullWidth: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressSection() {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.borderLight),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Adresses', style: AppTypography.h3),
            const SizedBox(height: 16),
            _buildAddressInfo('Adresse d\'enlèvement', parcel.pickupAddress),
            const Divider(height: 32),
            _buildAddressInfo('Adresse de livraison', parcel.deliveryAddress),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressInfo(String title, Address address) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.body1.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text('${address.street}, ${address.state}', style: AppTypography.body1),
        Text(
          '${address.city}, ${address.country}',
          style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildTransportSection() {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.borderLight),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Type de transport', style: AppTypography.h3),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  _getTransportIcon(),
                  color: AppColors.primaryGreen,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(_getTransportText(), style: AppTypography.body1),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceSection() {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.borderLight),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Prix total', style: AppTypography.h3),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Frais de livraison', style: AppTypography.body1),
                Text(
                  '${parcel.price} FCFA',
                  style: AppTypography.h3.copyWith(color: AppColors.success),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getTransportIcon() {
    switch (parcel.transportType) {
      case TransportType.moto:
        return Icons.motorcycle;
      case TransportType.car:
        return Icons.directions_car;
      case TransportType.truck:
        return Icons.local_shipping;
      default:
        return Icons.motorcycle;
    }
  }

  String _getTransportText() {
    switch (parcel.transportType) {
      case TransportType.moto:
        return 'Moto (Standard)';
      case TransportType.car:
        return 'Voiture (Premium)';
      case TransportType.truck:
        return 'Camion (Express)';
      default:
        return 'Transport standard';
    }
  }

  void _confirmAndPay(BuildContext context) {
    // Générer un numéro de suivi
    final trackingNumber =
        'CE${DateTime.now().year}-${(1000 + parcel.id.hashCode % 9000).toString().padLeft(3, '0')}';

    // Navigation vers la page de confirmation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => ConfirmationScreen(trackingNumber: trackingNumber),
      ),
    );
  }

  Widget _buildParcelDetailsSection() {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.borderLight),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Détails du colis', style: AppTypography.h3),
            const SizedBox(height: 16),
            _buildDetailRow('Description', parcel.description),
            if (parcel.weight != null)
              _buildDetailRow('Poids', '${parcel.weight} kg'),
            if (parcel.dimensions != null)
              _buildDetailRow('Dimensions', parcel.dimensions!),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTypography.body1.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(value, style: AppTypography.body1),
        ],
      ),
    );
  }
}
