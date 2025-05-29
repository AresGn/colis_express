import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:benin_express/presentation/core/theme/app_colors.dart';
// import 'package:benin_express/presentation/core/theme/app_typography.dart';

/// Widget pour sélectionner une photo de colis
class ParcelPhotoPicker extends StatelessWidget {
  final File? photoFile;
  final Function() onPickPhoto;
  final Function()? onRemovePhoto;

  const ParcelPhotoPicker({
    super.key,
    required this.photoFile,
    required this.onPickPhoto,
    this.onRemovePhoto,
  });

  @override
  Widget build(BuildContext context) {
    if (photoFile == null) {
      return _buildEmptyPicker();
    } else {
      return _buildPhotoPreview();
    }
  }

  Widget _buildEmptyPicker() {
    return Builder(
      builder:
          (context) => GestureDetector(
            onTap: onPickPhoto,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.textTertiary,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              height: 80,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_a_photo_outlined,
                      color: AppColors.textSecondary,
                      size: 24,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Ajouter une photo',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  Widget _buildPhotoPreview() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(
            photoFile!,
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        if (onRemovePhoto != null)
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: onRemovePhoto,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, color: Colors.white, size: 16),
              ),
            ),
          ),
      ],
    );
  }

  /// Méthode statique pour faciliter la sélection de photo
  static Future<File?> pickImage({
    ImageSource source = ImageSource.gallery,
  }) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}
