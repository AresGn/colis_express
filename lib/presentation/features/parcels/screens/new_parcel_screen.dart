import 'dart:io';
import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_colors.dart';
import 'package:benin_express/presentation/core/widgets/custom_button.dart';
import 'package:benin_express/presentation/features/parcels/widgets/address_form_section.dart';
import 'package:benin_express/presentation/features/parcels/widgets/parcel_info_section.dart';
import 'package:benin_express/presentation/features/parcels/widgets/parcel_photo_picker.dart';
import 'package:benin_express/presentation/features/parcels/screens/transport_selection_screen.dart';
import 'package:benin_express/presentation/features/auth/widgets/user_type_selector.dart';

// Using the UserType enum from auth/widgets/user_type_selector.dart
// Previously: enum UserType { customer, transporter, admin }

class NewParcelScreen extends StatefulWidget {
  final UserType userType;

  const NewParcelScreen({super.key, required this.userType});

  @override
  State<NewParcelScreen> createState() => _NewParcelScreenState();
}

class _NewParcelScreenState extends State<NewParcelScreen> {
  // Clé du formulaire pour validation
  final _formKey = GlobalKey<FormState>();

  // Contrôleurs pour les champs de formulaire avec valeurs par défaut pour faciliter les tests
  final TextEditingController _expediteurNomController = TextEditingController(
    text: 'Jean Dupont',
  );
  final TextEditingController _expediteurTelController = TextEditingController(
    text: '97123456',
  );
  final TextEditingController _expediteurAdresseController =
      TextEditingController(text: 'Quartier Ganhi, Cotonou');
  final TextEditingController _destinataireNomController =
      TextEditingController(text: 'Marie Kone');
  final TextEditingController _destinataireTelController =
      TextEditingController(text: '96654321');
  final TextEditingController _destinataireAdresseController =
      TextEditingController(text: 'Quartier Banikoara, Parakou');
  final TextEditingController _colisDescriptionController =
      TextEditingController(text: 'Documents importants');

  // État de la photo
  File? _colisPhoto;

  // Méthode pour sélectionner une photo
  Future<void> _pickPhoto() async {
    final File? pickedPhoto = await ParcelPhotoPicker.pickImage();
    if (pickedPhoto != null) {
      setState(() {
        _colisPhoto = pickedPhoto;
      });
    }
  }

  // Méthode pour supprimer la photo
  void _removePhoto() {
    setState(() {
      _colisPhoto = null;
    });
  }

  // Validation standard pour les champs requis
  String? _requiredFieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ce champ est requis';
    }
    return null;
  }

  // Soumission du formulaire
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Navigation vers l'écran de sélection de transport
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => TransportSelectionScreen(
                // TODO: Passer les données du formulaire au prochain écran
              ),
        ),
      );
    }
  }

  @override
  void dispose() {
    // Libération des ressources
    _expediteurNomController.dispose();
    _expediteurTelController.dispose();
    _expediteurAdresseController.dispose();
    _destinataireNomController.dispose();
    _destinataireTelController.dispose();
    _destinataireAdresseController.dispose();
    _colisDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Nouveau colis'),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primaryGreen,
        elevation: 0.5,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Zone de défilement pour le formulaire
            Expanded(child: _buildForm()),

            // Bouton de soumission en bas
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Section Expéditeur
              AddressFormSection(
                title: '👤 Expéditeur',
                nameController: _expediteurNomController,
                phoneController: _expediteurTelController,
                addressController: _expediteurAdresseController,
                validator: _requiredFieldValidator,
              ),
              const SizedBox(height: 20),

              // Section Destinataire
              AddressFormSection(
                title: '📍 Destinataire',
                nameController: _destinataireNomController,
                phoneController: _destinataireTelController,
                addressController: _destinataireAdresseController,
                validator: _requiredFieldValidator,
              ),
              const SizedBox(height: 20),

              // Section Colis
              ParcelInfoSection(
                descriptionController: _colisDescriptionController,
                photoFile: _colisPhoto,
                onPickPhoto: _pickPhoto,
                onRemovePhoto: _removePhoto,
                validator: _requiredFieldValidator,
              ),

              // Espace supplémentaire en bas pour le défilement
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, -1),
            blurRadius: 4,
          ),
        ],
      ),
      child: CustomButton(
        text: 'Continuer',
        onPressed: _submitForm,
        variant: ButtonVariant.primary,
        size: ButtonSize.large,
        isFullWidth: true,
      ),
    );
  }
}
