import 'package:benin_express/domain/models/parcel_status.dart';
import 'package:flutter/material.dart';
import 'package:benin_express/domain/models/parcel.dart';
import 'package:benin_express/presentation/features/tracking/widgets/timeline_step.dart';

/// Widget qui affiche la timeline des events de suivi d'un colis
class TrackingTimeline extends StatelessWidget {
  final Parcel parcel;

  const TrackingTimeline({super.key, required this.parcel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Suivi de la livraison', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            _buildTimelineSteps(),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineSteps() {
    // Étapes de la timeline en fonction du statut du colis
    final bool isProcessing = parcel.status.index >= ParcelStatus.processing.index;
    final bool isPickedUp = parcel.status.index >= ParcelStatus.pickedUp.index;
    final bool isInTransit = parcel.status.index >= ParcelStatus.inTransit.index;
    final bool isOutForDelivery = parcel.status.index >= ParcelStatus.outForDelivery.index;
    final bool isDelivered = parcel.status == ParcelStatus.delivered;

    return Column(
      children: [
        TimelineStep(
          title: 'Commande enregistrée',
          time: _formatDateTime(parcel.createdAt),
          description: 'Votre commande a été enregistrée.',
          status: TrackingEventStatus.completed,
        ),
        TimelineStep(
          title: 'En cours de préparation',
          time: isProcessing ? _formatDateTime(parcel.updatedAt) : '-',
          description: 'Votre colis est en cours de préparation.',
          status: isProcessing 
              ? TrackingEventStatus.completed 
              : TrackingEventStatus.upcoming,
        ),
        TimelineStep(
          title: 'Colis collecté',
          time: isPickedUp ? _formatDateTime(parcel.updatedAt) : '-',
          description: 'Le colis a été collecté par notre transporteur.',
          status: isPickedUp 
              ? TrackingEventStatus.completed 
              : TrackingEventStatus.upcoming,
        ),
        TimelineStep(
          title: 'En transit',
          time: isInTransit ? _formatDateTime(parcel.updatedAt) : '-',
          description: 'Votre colis est en route vers sa destination.',
          status: isInTransit 
              ? (isOutForDelivery ? TrackingEventStatus.completed : TrackingEventStatus.current)
              : TrackingEventStatus.upcoming,
        ),
        TimelineStep(
          title: 'En cours de livraison',
          time: isOutForDelivery ? _formatDateTime(parcel.updatedAt) : '-',
          description: 'Le livreur est en route vers l\'adresse de livraison.',
          status: isOutForDelivery 
              ? (isDelivered ? TrackingEventStatus.completed : TrackingEventStatus.current)
              : TrackingEventStatus.upcoming,
        ),
        TimelineStep(
          title: 'Livré',
          time: isDelivered ? _formatDateTime(parcel.updatedAt) : '-',
          description: 'Votre colis a été livré avec succès.',
          status: isDelivered 
              ? TrackingEventStatus.completed 
              : TrackingEventStatus.upcoming,
          isLast: true,
        ),
      ],
    );
  }
  
  // Formater la date et l'heure pour l'affichage
  String _formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return '-';
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} $hour:$minute';
  }
}
