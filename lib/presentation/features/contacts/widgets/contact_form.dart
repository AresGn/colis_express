import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_colors.dart';
import 'package:benin_express/presentation/core/theme/app_typography.dart';
import 'package:benin_express/presentation/core/widgets/custom_button.dart';
import 'package:benin_express/presentation/core/widgets/custom_input_field.dart';
import 'package:benin_express/domain/models/saved_contact.dart';

/// Formulaire pour ajouter ou modifier un contact
class ContactForm extends StatefulWidget {
  final SavedContact? contact; // null pour un nouveau contact
  final Function(SavedContact) onSave;

  const ContactForm({
    super.key,
    this.contact,
    required this.onSave,
  });

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _addressController;
  late final TextEditingController _labelController;
  bool _isDefault = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.contact?.name ?? '');
    _phoneController = TextEditingController(text: widget.contact?.phoneNumber ?? '');
    _emailController = TextEditingController(text: widget.contact?.email ?? '');
    _addressController = TextEditingController(text: widget.contact?.address ?? '');
    _labelController = TextEditingController(text: widget.contact?.label ?? '');
    _isDefault = widget.contact?.isDefault ?? false;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _labelController.dispose();
    super.dispose();
  }

  void _saveContact() {
    if (_formKey.currentState!.validate()) {
      final contact = SavedContact(
        id: widget.contact?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text.trim(),
        phoneNumber: _phoneController.text.trim(),
        email: _emailController.text.trim().isEmpty ? null : _emailController.text.trim(),
        address: _addressController.text.trim(),
        label: _labelController.text.trim().isEmpty ? null : _labelController.text.trim(),
        isDefault: _isDefault,
        createdAt: widget.contact?.createdAt ?? DateTime.now(),
        updatedAt: widget.contact != null ? DateTime.now() : null,
      );
      
      widget.onSave(contact);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // En-tête
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.contact == null ? 'Nouveau contact' : 'Modifier le contact',
                  style: AppTypography.h3,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Formulaire
          Form(
            key: _formKey,
            child: Column(
              children: [
                // Nom
                CustomInputField(
                  controller: _nameController,
                  label: 'Nom complet',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Le nom est requis';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                // Téléphone
                CustomInputField(
                  controller: _phoneController,
                  label: 'Téléphone',
                  prefix: '+229',
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Le numéro de téléphone est requis';
                    }
                    if (value.trim().length < 8) {
                      return 'Numéro de téléphone invalide';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                // Email (optionnel)
                CustomInputField(
                  controller: _emailController,
                  label: 'Email (optionnel)',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value != null && value.trim().isNotEmpty) {
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                        return 'Email invalide';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                // Adresse
                CustomInputField(
                  controller: _addressController,
                  label: 'Adresse',
                  maxLines: 2,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'L\'adresse est requise';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                // Label (optionnel)
                CustomInputField(
                  controller: _labelController,
                  label: 'Étiquette (optionnel)',
                  hint: 'Ex: Famille, Travail, Ami...',
                ),
                const SizedBox(height: 16),
                
                // Contact par défaut
                Row(
                  children: [
                    Checkbox(
                      value: _isDefault,
                      onChanged: (value) {
                        setState(() {
                          _isDefault = value ?? false;
                        });
                      },
                      activeColor: AppColors.primaryGreen,
                    ),
                    Expanded(
                      child: Text(
                        'Définir comme contact par défaut',
                        style: AppTypography.body2,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 24),
                
                // Boutons
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'Annuler',
                        onPressed: () => Navigator.pop(context),
                        variant: ButtonVariant.outline,
                        size: ButtonSize.medium,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomButton(
                        text: widget.contact == null ? 'Ajouter' : 'Modifier',
                        onPressed: _saveContact,
                        variant: ButtonVariant.primary,
                        size: ButtonSize.medium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
