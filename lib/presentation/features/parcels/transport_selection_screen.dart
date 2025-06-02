import 'package:flutter/material.dart';
import 'package:agbantche/presentation/common/widgets/transport/transport_header.dart';
import 'package:agbantche/presentation/common/widgets/transport/transport_trip_info.dart';
import 'package:agbantche/presentation/common/widgets/transport/transport_list.dart';
import 'package:agbantche/presentation/features/parcels/screens/validation_screen.dart';
import 'package:agbantche/presentation/features/auth/widgets/user_type_selector.dart';
import 'package:agbantche/domain/models/parcel.dart';
import 'package:agbantche/domain/models/address.dart';
import 'package:agbantche/domain/models/transport_type.dart';
import 'package:agbantche/domain/models/parcel_status.dart';
import 'package:agbantche/domain/models/contact.dart';

class TransportSelectionScreen extends StatelessWidget {
  final UserType userType;

  const TransportSelectionScreen({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            const TransportHeader(),
            const TransportTripInfo(),
            Expanded(
              child: TransportList(
                onTransporteurSelected: () {
                  // TODO: Remplacer par les données réelles passées depuis l'écran précédent
                  final parcel = Parcel(
                    id: 'TEMP-ID',
                    trackingNumber: 'BEN-123456',
                    description: 'Colis temporaire',
                    status: ParcelStatus.pending,
                    createdAt: DateTime.now(),
                    weight: 2.5,
                    dimensions: '30x20x15 cm',
                    pickupAddress: Address(
                      street: '123 Rue Exemple',
                      city: 'Cotonou',
                      postalCode: '00000',
                      country: 'Bénin',
                      state: 'Littoral',
                    ),
                    deliveryAddress: Address(
                      street: '456 Avenue Test',
                      city: 'Porto-Novo',
                      postalCode: '00000',
                      country: 'Bénin',
                      state: 'Ouémé',
                    ),
                    sender: Contact(
                      name: 'Jean Dupont',
                      phoneNumber: '+22991234567',
                      email: 'jean@example.com',
                    ),
                    recipient: Contact(
                      name: 'Marie Kokou',
                      phoneNumber: '+22997654321',
                    ),
                    transportType: TransportType.express,
                    price: 5000,
                  );

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ValidationScreen(parcel: parcel),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
