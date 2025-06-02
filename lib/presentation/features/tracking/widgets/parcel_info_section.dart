import 'package:flutter/material.dart';
import 'package:agbantche/domain/models/parcel.dart';
import 'package:agbantche/domain/models/transport_type.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';

/// Widget qui affiche les informations détaillées d'un colis
class ParcelInfoSection extends StatelessWidget {
  final Parcel parcel;

  const ParcelInfoSection({super.key, required this.parcel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informations du colis',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            _buildInfoRow(context, 'N° de suivi:', parcel.trackingNumber),
            _buildInfoRow(context, 'Description:', parcel.description),
            _buildInfoRow(
              context,
              'Poids:',
              parcel.weight != null ? '${parcel.weight} kg' : '-',
            ),
            _buildInfoRow(context, 'Dimensions:', parcel.dimensions ?? '-'),
            _buildInfoRow(context, 'Transport:', _getTransportTypeText()),
          ],
        ),
      ),
    );
  }

  // Ligne d'information avec titre et valeur
  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style:
                  Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ) ??
                  TextStyle(fontSize: 14, color: AppColors.textSecondary),
            ),
          ),
          Expanded(
            child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }

  // Obtenir le texte du type de transport
  String _getTransportTypeText() {
    switch (parcel.transportType) {
      case TransportType.moto:
        return 'Moto';
      case TransportType.car:
        return 'Voiture';
      case TransportType.truck:
        return 'Camion';
      default:
        return 'Inconnu';
    }
  }
}
