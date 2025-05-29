import 'package:flutter/material.dart';
import 'package:benin_express/domain/models/parcel.dart';
import 'package:benin_express/domain/models/parcel_status.dart';
import 'package:benin_express/domain/models/address.dart';
import 'package:benin_express/domain/models/contact.dart';
import 'package:benin_express/domain/models/transport_type.dart';
import 'package:benin_express/presentation/core/theme/app_colors.dart';
import 'package:benin_express/presentation/features/parcels/widgets/status_banner.dart';
import 'package:benin_express/presentation/features/tracking/widgets/parcel_info_section.dart';
import 'package:benin_express/presentation/features/tracking/widgets/contacts_section.dart';
import 'package:benin_express/presentation/features/tracking/widgets/tracking_timeline.dart';
import 'package:benin_express/presentation/features/tracking/widgets/tracking_action_buttons.dart';

/// u00c9cran du00e9taillu00e9 du suivi d'un colis
class TrackingDetailsScreen extends StatefulWidget {
  final String trackingNumber;

  const TrackingDetailsScreen({super.key, required this.trackingNumber});

  @override
  State<TrackingDetailsScreen> createState() => _TrackingDetailsScreenState();
}

class _TrackingDetailsScreenState extends State<TrackingDetailsScreen> {
  // Variables d'u00e9tat
  bool _isCollected = false;
  bool _isLoading = true;
  late Parcel parcel;

  @override
  void initState() {
    super.initState();
    // Initialiser les donnu00e9es du colis
    parcel = Parcel(
      id: widget.trackingNumber,
      trackingNumber: widget.trackingNumber,
      description: "Colis u00e9lectronique",
      status: ParcelStatus.inTransit,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      updatedAt: DateTime.now(),
      sender: Contact(
        name: "Jean Dupont",
        phoneNumber: "+22967123456",
        email: "jean.dupont@example.com",
      ),
      recipient: Contact(
        name: "Marie Koutouan",
        phoneNumber: "+22997654321",
        email: "marie.koutouan@example.com",
      ),
      weight: 2.5,
      dimensions: "30x20x15 cm",
      price: 15000,
      transportType: TransportType.moto,
      pickupAddress: Address(
        street: "123 Rue du Commerce",
        city: "Cotonou",
        state: "Littoral",
        district: "Akpakpa",
        country: "Bu00e9nin",
      ),
      deliveryAddress: Address(
        street: "456 Avenue des Palmiers",
        city: "Cotonou",
        state: "Littoral",
        district: "Calavi",
        country: "Bu00e9nin",
      ),
    );

    // Simuler le chargement des donnu00e9es
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Du00e9tails du suivi'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: _isLoading ? _buildLoadingState() : _buildContent(),
    );
  }

  // u00c9tat de chargement
  Widget _buildLoadingState() {
    return const SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Chargement des informations...'),
          ],
        ),
      ),
    );
  }

  // Contenu principal de l'u00e9cran
  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Banniu00e8re de statut
          StatusBanner(
            emoji: 'ud83dude9a',
            message: 'Votre colis est en transit',
            estimatedArrival: '17:30',
            status: _mapParcelStatusToDeliveryStatus(parcel.status),
            statusTitle: _getStatusTitle(parcel.status),
            statusDescription: _getStatusDescription(parcel.status),
          ),

          // Sections d'information
          ParcelInfoSection(parcel: parcel),
          TrackingTimeline(parcel: parcel),
          ContactsSection(parcel: parcel),
          TrackingActionButtons(
            trackingNumber: widget.trackingNumber,
            isCollected: _isCollected,
            onCollectPressed: () {
              setState(() {
                _isCollected = true;
              });
              // TODO: Mettre u00e0 jour le statut sur le serveur
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Ru00e9ception du colis confirmu00e9e avec succu00e8s!'),
                  backgroundColor: AppColors.success,
                ),
              );
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // Helper to map ParcelStatus to DeliveryStatus
  DeliveryStatus _mapParcelStatusToDeliveryStatus(ParcelStatus status) {
    // Using exhaustive switch pattern with return statement
    return switch (status) {
      ParcelStatus.pending || ParcelStatus.processing => DeliveryStatus.pending,
      ParcelStatus.pickedUp || ParcelStatus.inTransit || ParcelStatus.outForDelivery => DeliveryStatus.inTransit,
      ParcelStatus.delivered => DeliveryStatus.delivered,
      ParcelStatus.cancelled => DeliveryStatus.cancelled,
    };
  }

  // Helper to get StatusBanner title based on ParcelStatus
  String _getStatusTitle(ParcelStatus status) {
    // Using exhaustive switch expression
    return switch (status) {
      ParcelStatus.pending => 'En attente',
      ParcelStatus.processing => 'En préparation',
      ParcelStatus.pickedUp => 'Colis collecté',
      ParcelStatus.inTransit => 'En transit',
      ParcelStatus.outForDelivery => 'En cours de livraison',
      ParcelStatus.delivered => 'Livré',
      ParcelStatus.cancelled => 'Annulé'
    };
  }

  // Helper to get StatusBanner description based on ParcelStatus
  String _getStatusDescription(ParcelStatus status) {
    // Using exhaustive switch expression
    return switch (status) {
      ParcelStatus.pending => 'Votre commande est en attente de traitement.',
      ParcelStatus.processing => 'Votre colis est en cours de préparation pour l\'expédition.',
      ParcelStatus.pickedUp => 'Votre colis a été collecté par le transporteur.',
      ParcelStatus.inTransit => 'Votre colis est en route vers sa destination.',
      ParcelStatus.outForDelivery => 'Votre colis est avec le livreur et sera bientôt livré.',
      ParcelStatus.delivered => 'Votre colis a été livré avec succès.',
      ParcelStatus.cancelled => 'Votre commande a été annulée.'
    };
  }
}
