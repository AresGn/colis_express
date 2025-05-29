import 'package:flutter/material.dart';
import 'package:benin_express/presentation/features/parcels/models/transport_option.dart';
import 'package:benin_express/presentation/features/parcels/widgets/transport_option_card.dart';

/// Liste des options de transport disponibles
class TransportOptionsList extends StatelessWidget {
  final List<TransportOption> options;
  final int selectedIndex;
  final Function(int) onOptionSelected;

  const TransportOptionsList({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: options.length,
      itemBuilder: (context, index) {
        return TransportOptionCard(
          option: options[index],
          isSelected: index == selectedIndex,
          onTap: () => onOptionSelected(index),
        );
      },
    );
  }
}
