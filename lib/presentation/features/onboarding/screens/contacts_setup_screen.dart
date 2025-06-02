import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/theme/app_typography.dart';
import 'package:agbantche/presentation/core/widgets/custom_button.dart';
import 'package:agbantche/presentation/core/widgets/custom_input_field.dart';
import 'package:agbantche/presentation/core/navigation/route_names.dart';
import 'package:agbantche/presentation/features/onboarding/widgets/setup_progress_indicator.dart';
import 'package:agbantche/domain/models/saved_contact.dart';

/// Écran de configuration des contacts de livraison
class ContactsSetupScreen extends StatefulWidget {
  const ContactsSetupScreen({super.key});

  @override
  State<ContactsSetupScreen> createState() => _ContactsSetupScreenState();
}

class _ContactsSetupScreenState extends State<ContactsSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _labelController = TextEditingController();

  List<SavedContact> _contacts = [];
  bool _isDefault = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _labelController.dispose();
    super.dispose();
  }

  void _addContact() {
    if (_formKey.currentState!.validate()) {
      final newContact = SavedContact(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text.trim(),
        phoneNumber: _phoneController.text.trim(),
        address: _addressController.text.trim(),
        label:
            _labelController.text.trim().isEmpty
                ? null
                : _labelController.text.trim(),
        isDefault: _isDefault || _contacts.isEmpty, // Premier contact = défaut
        createdAt: DateTime.now(),
      );

      setState(() {
        // Si ce contact est défini comme défaut, retirer le défaut des autres
        if (_isDefault) {
          _contacts =
              _contacts
                  .map((contact) => contact.copyWith(isDefault: false))
                  .toList();
        }
        _contacts.add(newContact);
        _clearForm();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Contact ajouté avec succès'),
          backgroundColor: AppColors.success,
        ),
      );
    }
  }

  void _clearForm() {
    _nameController.clear();
    _phoneController.clear();
    _addressController.clear();
    _labelController.clear();
    _isDefault = false;
  }

  void _removeContact(String id) {
    setState(() {
      _contacts.removeWhere((contact) => contact.id == id);
      // Si on supprime le contact par défaut et qu'il reste des contacts,
      // définir le premier comme défaut
      if (_contacts.isNotEmpty &&
          !_contacts.any((contact) => contact.isDefault)) {
        _contacts[0] = _contacts[0].copyWith(isDefault: true);
      }
    });
  }

  void _continueToNextStep() {
    // TODO: Sauvegarder les contacts
    Navigator.pushNamed(context, RouteNames.deliveryPreferencesSetup);
  }

  void _goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: _goBack,
        ),
        title: Text(
          'Contacts de livraison',
          style: AppTypography.h3.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Indicateur de progression
              const SetupProgressIndicator(
                currentStep: 3,
                totalSteps: 6,
                stepTitle: 'Vos contacts fréquents',
              ),

              const SizedBox(height: 24),

              // Contenu principal
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Description
                      Text(
                        'Ajoutez vos contacts de livraison fréquents pour un remplissage automatique lors de vos commandes.',
                        style: AppTypography.body1.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Liste des contacts ajoutés
                      if (_contacts.isNotEmpty) ...[
                        Text(
                          'Contacts ajoutés (${_contacts.length})',
                          style: AppTypography.h4.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ..._contacts.map(
                          (contact) => _buildContactCard(contact),
                        ),
                        const SizedBox(height: 24),
                      ],

                      // Formulaire d'ajout
                      _buildContactForm(),
                    ],
                  ),
                ),
              ),

              // Boutons d'action
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard(SavedContact contact) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color:
              contact.isDefault
                  ? AppColors.primaryGreen
                  : AppColors.borderLight,
          width: contact.isDefault ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.primaryGreen.withValues(alpha: 0.1),
            child: Text(
              contact.name.isNotEmpty ? contact.name[0].toUpperCase() : 'C',
              style: AppTypography.body1.copyWith(
                color: AppColors.primaryGreen,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      contact.name,
                      style: AppTypography.body1.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    if (contact.isDefault) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryGreen,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Défaut',
                          style: AppTypography.caption.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  contact.phoneNumber,
                  style: AppTypography.body2.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                if (contact.label != null && contact.label!.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    contact.label!,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ],
            ),
          ),

          IconButton(
            icon: const Icon(Icons.delete_outline, color: AppColors.error),
            onPressed: () => _removeContact(contact.id),
          ),
        ],
      ),
    );
  }

  Widget _buildContactForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ajouter un nouveau contact',
            style: AppTypography.h4.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 16),

          // Nom du contact
          CustomInputField(
            controller: _nameController,
            label: 'Nom complet',
            hint: 'Ex: Marie Kone',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Le nom est requis';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          // Numéro de téléphone
          CustomInputField(
            controller: _phoneController,
            label: 'Numéro de téléphone',
            hint: 'Ex: 96 12 34 56',
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Le numéro de téléphone est requis';
              }
              final cleanPhone = value.replaceAll(RegExp(r'[^\d]'), '');
              if (cleanPhone.length < 8) {
                return 'Numéro de téléphone invalide';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          // Adresse de livraison
          CustomInputField(
            controller: _addressController,
            label: 'Adresse de livraison',
            hint: 'Ex: Quartier Tokpa, Cotonou',
            maxLines: 2,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'L\'adresse de livraison est requise';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          // Label/Catégorie
          CustomInputField(
            controller: _labelController,
            label: 'Catégorie (optionnel)',
            hint: 'Ex: Famille, Travail, Ami...',
          ),

          const SizedBox(height: 16),

          // Checkbox pour contact par défaut
          CheckboxListTile(
            value: _isDefault,
            onChanged: (value) {
              setState(() {
                _isDefault = value ?? false;
              });
            },
            title: Text(
              'Définir comme contact par défaut',
              style: AppTypography.body2.copyWith(color: AppColors.textPrimary),
            ),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            activeColor: AppColors.primaryGreen,
          ),

          const SizedBox(height: 20),

          // Bouton d'ajout
          CustomButton(
            text: 'Ajouter ce contact',
            onPressed: _addContact,
            variant: ButtonVariant.outline,
            size: ButtonSize.medium,
            isFullWidth: true,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        CustomButton(
          text: _contacts.isEmpty ? 'Passer cette étape' : 'Continuer',
          onPressed: _continueToNextStep,
          variant: ButtonVariant.primary,
          size: ButtonSize.large,
          isFullWidth: true,
        ),

        if (_contacts.isNotEmpty) ...[
          const SizedBox(height: 12),
          TextButton(
            onPressed: _continueToNextStep,
            child: Text(
              'Passer cette étape',
              style: AppTypography.body2.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
