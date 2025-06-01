import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_colors.dart';
import 'package:benin_express/presentation/core/theme/app_typography.dart';
import 'package:benin_express/presentation/features/parcels/screens/validation_screen.dart';
import 'package:benin_express/domain/models/parcel.dart';
import 'package:benin_express/domain/models/parcel_status.dart';
import 'package:benin_express/domain/models/address.dart';
import 'package:benin_express/domain/models/contact.dart';
import 'package:benin_express/domain/models/transport_type.dart';
import 'package:benin_express/presentation/features/parcels/models/transporter.dart';
import 'package:benin_express/presentation/features/parcels/widgets/transport_header_info.dart';
import 'package:benin_express/presentation/features/parcels/widgets/new_transport_list.dart';

/// Écran de sélection du mode de transport pour un colis
class TransportSelectionScreen extends StatefulWidget {
  // On pourrait ajouter des paramètres pour recevoir les données du formulaire précédent
  const TransportSelectionScreen({super.key});

  @override
  State<TransportSelectionScreen> createState() =>
      _TransportSelectionScreenState();
}

class _TransportSelectionScreenState extends State<TransportSelectionScreen> {
  Transporter? _selectedTransporter;

  // Objet Parcel fictif pour la démonstration
  // TODO: Remplacer par les données réelles passées depuis l'écran précédent
  final Parcel _dummyParcel = Parcel(
    id: 'dummy_id',
    trackingNumber: 'DUMMY123456789',
    status: ParcelStatus.pending,
    description: 'Dummy Parcel Description',
    createdAt: DateTime.now(),
    pickupAddress: Address(
      street: 'Dummy Pickup St',
      city: 'Cotonou',
      state: 'Littoral',
      country: 'Bénin',
      district: '',
    ),
    deliveryAddress: Address(
      street: 'Dummy Delivery Ave',
      city: 'Parakou',
      state: 'Borgou',
      country: 'Bénin',
      district: '',
    ),
    sender: Contact(name: 'Dummy Sender', phoneNumber: '1234567890', email: ''),
    recipient: Contact(
      name: 'Dummy Recipient',
      phoneNumber: '0987654321',
      email: '',
    ),
    price: 0.0, // Le prix sera mis à jour selon l'option de transport
    transportType: TransportType.standard, // Placeholder, sera mis à jour
  );

  // Liste des transporteurs disponibles (conforme au design)
  final List<Transporter> _transporters = [
    Transporter(
      id: 'transexpress',
      name: 'TransExpress',
      logo: '🚛',
      isRecommended: true,
      rating: 4.8,
      reviewCount: 127,
      price: 2500,
      estimatedTime: '2h',
      vehicleType: 'Camion',
      vehicleIcon: '🚛',
      primaryColor: AppColors.primaryGreen,
      secondaryColor: AppColors.primaryGreen.withValues(alpha: 0.1),
    ),
    Transporter(
      id: 'rapidcolis',
      name: 'RapidColis',
      logo: '🚐',
      isRecommended: false,
      rating: 4.6,
      reviewCount: 89,
      price: 2200,
      estimatedTime: '3h',
      vehicleType: 'Fourgon',
      vehicleIcon: '🚐',
      primaryColor: AppColors.primaryBlue,
      secondaryColor: AppColors.primaryBlue.withValues(alpha: 0.1),
    ),
    Transporter(
      id: 'motolivraison',
      name: 'MotoLivraison',
      logo: '🏍️',
      isRecommended: false,
      rating: 4.9,
      reviewCount: 203,
      price: 1800,
      estimatedTime: '1h',
      vehicleType: 'Moto',
      vehicleIcon: '🏍️',
      primaryColor: AppColors.primaryYellow,
      secondaryColor: AppColors.primaryYellow.withValues(alpha: 0.1),
    ),
  ];

  void _selectTransporter(Transporter transporter) {
    setState(() {
      _selectedTransporter = transporter;
    });

    // Navigation immédiate vers l'écran de validation
    final parcelToSend = Parcel(
      id: _dummyParcel.id,
      trackingNumber: _dummyParcel.trackingNumber,
      status: _dummyParcel.status,
      description: _dummyParcel.description,
      createdAt: _dummyParcel.createdAt,
      updatedAt: _dummyParcel.updatedAt,
      estimatedDelivery: _dummyParcel.estimatedDelivery,
      deliveryDate: _dummyParcel.deliveryDate,
      pickupAddress: _dummyParcel.pickupAddress,
      deliveryAddress: _dummyParcel.deliveryAddress,
      sender: _dummyParcel.sender,
      recipient: _dummyParcel.recipient,
      weight: _dummyParcel.weight,
      dimensions: _dummyParcel.dimensions,
      price: transporter.price.toDouble(),
      transportType: _getTransportTypeFromVehicle(transporter.vehicleType),
      history: _dummyParcel.history,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ValidationScreen(parcel: parcelToSend),
      ),
    );
  }

  TransportType _getTransportTypeFromVehicle(String vehicleType) {
    switch (vehicleType.toLowerCase()) {
      case 'moto':
        return TransportType.moto;
      case 'fourgon':
        return TransportType.car;
      case 'camion':
        return TransportType.truck;
      default:
        return TransportType.standard;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Choisir transporteur',
          style: AppTypography.h3.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // En-tête avec informations de trajet
            TransportHeaderInfo(
              fromCity: _dummyParcel.pickupAddress.city,
              toCity: _dummyParcel.deliveryAddress.city,
              estimatedDistance: '420 km',
            ),

            // Liste des transporteurs
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: NewTransportList(
                  transporters: _transporters,
                  onTransporterSelected: _selectTransporter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
