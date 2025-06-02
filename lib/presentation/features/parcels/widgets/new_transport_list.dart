import 'package:flutter/material.dart';
import 'package:agbantche/presentation/features/parcels/models/transporter.dart';
import 'package:agbantche/presentation/features/parcels/widgets/new_transport_card.dart';

/// Liste des transporteurs avec le nouveau design
class NewTransportList extends StatelessWidget {
  final List<Transporter> transporters;
  final Function(Transporter) onTransporterSelected;

  const NewTransportList({
    super.key,
    required this.transporters,
    required this.onTransporterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transporters.length,
      itemBuilder: (context, index) {
        final transporter = transporters[index];
        return NewTransportCard(
          transporter: transporter,
          onSelect: () => onTransporterSelected(transporter),
        );
      },
    );
  }
}
