import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_colors.dart';
import 'package:benin_express/presentation/core/widgets/screen_header.dart';
import 'package:benin_express/presentation/features/parcels/screens/validation_screen.dart';
import 'package:benin_express/domain/models/parcel.dart';
import 'package:benin_express/domain/models/parcel_status.dart';
import 'package:benin_express/domain/models/address.dart';
import 'package:benin_express/domain/models/contact.dart';
import 'package:benin_express/domain/models/transport_type.dart';
import 'package:benin_express/presentation/features/parcels/models/transport_option.dart';
import 'package:benin_express/presentation/features/parcels/widgets/transport_options_list.dart';
import 'package:benin_express/presentation/features/parcels/widgets/continue_button_footer.dart';
import 'package:benin_express/presentation/features/parcels/utils/transport_mapper.dart';

/// u00c9cran de su00e9lection du mode de transport pour un colis
class TransportSelectionScreen extends StatefulWidget {
  // On pourrait ajouter des paramu00e8tres pour recevoir les donnu00e9es du formulaire pru00e9cu00e9dent
  const TransportSelectionScreen({super.key});

  @override
  State<TransportSelectionScreen> createState() =>
      _TransportSelectionScreenState();
}

class _TransportSelectionScreenState extends State<TransportSelectionScreen> {
  int _selectedTransportIndex = -1;

  // Objet Parcel fictif pour la du00e9monstration
  // TODO: Remplacer par les donnu00e9es ru00e9elles passu00e9es depuis l'u00e9cran pru00e9cu00e9dent
  final Parcel _dummyParcel = Parcel(
    id: 'dummy_id',
    trackingNumber: 'DUMMY123456789',
    status: ParcelStatus.pending,
    description: 'Dummy Parcel Description',
    createdAt: DateTime.now(),
    pickupAddress: Address(
      street: 'Dummy Pickup St',
      city: 'Dummy City',
      state: 'Dummy State',
      country: 'Dummy Country',
      district: '',
    ),
    deliveryAddress: Address(
      street: 'Dummy Delivery Ave',
      city: 'Dummy City',
      state: 'Dummy State',
      country: 'Dummy Country',
      district: '',
    ),
    sender: Contact(name: 'Dummy Sender', phoneNumber: '1234567890', email: ''),
    recipient: Contact(
      name: 'Dummy Recipient',
      phoneNumber: '0987654321',
      email: '',
    ),
    price: 0.0, // Le prix sera mis u00e0 jour selon l'option de transport
    transportType: TransportType.standard, // Placeholder, sera mis u00e0 jour
  );

  // Liste des options de transport (statique pour l'instant)
  final List<TransportOption> _transportOptions = [
    TransportOption(
      name: 'Transport Express',
      price: 2500,
      deliveryTime: '1-2 heures',
      icon: Icons.electric_moped,
      iconColor: AppColors.primaryBlue,
    ),
    TransportOption(
      name: 'Transport Standard',
      price: 1500,
      deliveryTime: '3-5 heures',
      icon: Icons.delivery_dining,
      iconColor: AppColors.primaryGreen,
    ),
    TransportOption(
      name: 'Transport u00c9conomique',
      price: 1000,
      deliveryTime: '6-24 heures',
      icon: Icons.directions_bike,
      iconColor: AppColors.primaryYellow,
    ),
  ];

  void _selectTransport(int index) {
    setState(() {
      _selectedTransportIndex = index;
    });
  }

  void _continue() {
    if (_selectedTransportIndex >= 0) {
      // Cru00e9er un objet Parcel avec l'option de transport su00e9lectionnu00e9e
      final selectedTransportOption = _transportOptions[_selectedTransportIndex];
      final parcelToSend = TransportMapper.createParcelWithTransport(
        _dummyParcel,
        selectedTransportOption,
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ValidationScreen(parcel: parcelToSend),
        ),
      );
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
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // En-tu00eate de la page
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ScreenHeader(
                title: 'Su00e9lection du transport',
                subtitle: 'Choisissez le mode de transport qui vous convient le mieux',
              ),
            ),

            // Liste des options de transport
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: TransportOptionsList(
                  options: _transportOptions,
                  selectedIndex: _selectedTransportIndex,
                  onOptionSelected: _selectTransport,
                ),
              ),
            ),

            // Bouton continuer
            ContinueButtonFooter(
              onPressed: _continue,
              isEnabled: _selectedTransportIndex >= 0,
              text: 'Continuer',
            ),
          ],
        ),
      ),
    );
  }
}
