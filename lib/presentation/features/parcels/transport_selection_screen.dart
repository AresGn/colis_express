import 'package:flutter/material.dart';
import 'package:benin_express/presentation/common/widgets/transport/transport_header.dart';
import 'package:benin_express/presentation/common/widgets/transport/transport_trip_info.dart';
import 'package:benin_express/presentation/common/widgets/transport/transport_list.dart';
import 'package:benin_express/presentation/features/parcels/validation_screen.dart';
import 'package:benin_express/presentation/features/auth/login_screen.dart';

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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:
                          (context) => ValidationScreen(userType: userType),
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
