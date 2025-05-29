import 'dart:io';
import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/widgets/section_container.dart';
import 'package:benin_express/presentation/core/widgets/custom_input_field.dart';
import 'package:benin_express/presentation/features/parcels/widgets/parcel_photo_picker.dart';

/// Section du formulaire pour les informations du colis
class ParcelInfoSection extends StatelessWidget {
  final TextEditingController descriptionController;
  final File? photoFile;
  final Function() onPickPhoto;
  final Function() onRemovePhoto;
  final String? Function(String?) validator;

  const ParcelInfoSection({
    super.key,
    required this.descriptionController,
    required this.photoFile,
    required this.onPickPhoto,
    required this.onRemovePhoto,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: '📦 Colis',
      children: [
        // Description du contenu
        CustomInputField(
          controller: descriptionController,
          label: 'Description du contenu',
          maxLines: 2,
          validator: validator,
        ),
        const SizedBox(height: 16),

        // Sélecteur de photo
        ParcelPhotoPicker(
          photoFile: photoFile,
          onPickPhoto: onPickPhoto,
          onRemovePhoto: onRemovePhoto,
        ),
      ],
    );
  }
}
