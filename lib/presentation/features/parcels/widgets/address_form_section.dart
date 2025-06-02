import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/widgets/section_container.dart';
import 'package:agbantche/presentation/core/widgets/custom_input_field.dart';

/// Widget de formulaire pour les informations d'adresse (expéditeur ou destinataire)
class AddressFormSection extends StatelessWidget {
  final String title;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final String? Function(String?) validator;

  const AddressFormSection({
    super.key,
    required this.title,
    required this.nameController,
    required this.phoneController,
    required this.addressController,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: title,
      children: [
        // Nom complet
        CustomInputField(
          controller: nameController,
          label: 'Nom complet',
          validator: validator,
        ),
        const SizedBox(height: 12),

        // Numéro de téléphone
        CustomInputField(
          controller: phoneController,
          label: 'Téléphone',
          prefix: '+229',
          keyboardType: TextInputType.phone,
          validator: validator,
        ),
        const SizedBox(height: 12),

        // Adresse
        CustomInputField(
          controller: addressController,
          label:
              title.contains('Expéditeur')
                  ? 'Adresse de collecte'
                  : 'Adresse de livraison',
          maxLines: 2,
          validator: validator,
        ),
      ],
    );
  }
}
