import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/theme/app_typography.dart';
import 'package:agbantche/presentation/core/widgets/custom_button.dart';
import 'package:agbantche/presentation/core/widgets/custom_input_field.dart';
import 'package:agbantche/presentation/core/navigation/route_names.dart';
import 'package:agbantche/presentation/features/onboarding/widgets/setup_progress_indicator.dart';
import 'package:agbantche/domain/models/user_setup_data.dart';

/// Écran de configuration des adresses de collecte
class AddressSetupScreen extends StatefulWidget {
  const AddressSetupScreen({super.key});

  @override
  State<AddressSetupScreen> createState() => _AddressSetupScreenState();
}

class _AddressSetupScreenState extends State<AddressSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _labelController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _districtController = TextEditingController();
  final _landmarkController = TextEditingController();

  List<UserAddress> _addresses = [];
  bool _isDefault = false;

  @override
  void dispose() {
    _labelController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _districtController.dispose();
    _landmarkController.dispose();
    super.dispose();
  }

  void _addAddress() {
    if (_formKey.currentState!.validate()) {
      final newAddress = UserAddress(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        label: _labelController.text.trim(),
        fullAddress: _addressController.text.trim(),
        city: _cityController.text.trim().isEmpty ? null : _cityController.text.trim(),
        district: _districtController.text.trim().isEmpty ? null : _districtController.text.trim(),
        landmark: _landmarkController.text.trim().isEmpty ? null : _landmarkController.text.trim(),
        isDefault: _isDefault || _addresses.isEmpty, // Premier adresse = défaut
        createdAt: DateTime.now(),
      );

      setState(() {
        // Si cette adresse est définie comme défaut, retirer le défaut des autres
        if (_isDefault) {
          _addresses = _addresses.map((addr) => addr.copyWith(isDefault: false)).toList();
        }
        _addresses.add(newAddress);
        _clearForm();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Adresse ajoutée avec succès'),
          backgroundColor: AppColors.success,
        ),
      );
    }
  }

  void _clearForm() {
    _labelController.clear();
    _addressController.clear();
    _cityController.clear();
    _districtController.clear();
    _landmarkController.clear();
    _isDefault = false;
  }

  void _removeAddress(String id) {
    setState(() {
      _addresses.removeWhere((addr) => addr.id == id);
      // Si on supprime l'adresse par défaut et qu'il reste des adresses, 
      // définir la première comme défaut
      if (_addresses.isNotEmpty && !_addresses.any((addr) => addr.isDefault)) {
        _addresses[0] = _addresses[0].copyWith(isDefault: true);
      }
    });
  }

  void _continueToNextStep() {
    // TODO: Sauvegarder les adresses
    Navigator.pushNamed(context, RouteNames.contactsSetup);
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
          'Adresses de collecte',
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
                currentStep: 2,
                totalSteps: 6,
                stepTitle: 'Vos adresses fréquentes',
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
                        'Ajoutez vos adresses de collecte fréquentes pour faciliter vos futures commandes.',
                        style: AppTypography.body1.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Liste des adresses ajoutées
                      if (_addresses.isNotEmpty) ...[
                        Text(
                          'Adresses ajoutées (${_addresses.length})',
                          style: AppTypography.h4.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ..._addresses.map((address) => _buildAddressCard(address)),
                        const SizedBox(height: 24),
                      ],
                      
                      // Formulaire d'ajout
                      _buildAddressForm(),
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

  Widget _buildAddressCard(UserAddress address) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: address.isDefault 
              ? AppColors.primaryGreen 
              : AppColors.borderLight,
          width: address.isDefault ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      address.label,
                      style: AppTypography.body1.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    if (address.isDefault) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
                const SizedBox(height: 4),
                Text(
                  address.fullAddress,
                  style: AppTypography.body2.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                if (address.city != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    '${address.city}${address.district != null ? ', ${address.district}' : ''}',
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
            onPressed: () => _removeAddress(address.id),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ajouter une nouvelle adresse',
            style: AppTypography.h4.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Label de l'adresse
          CustomInputField(
            controller: _labelController,
            label: 'Nom de l\'adresse',
            hint: 'Ex: Maison, Bureau, Boutique...',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Le nom de l\'adresse est requis';
              }
              return null;
            },
          ),
          
          const SizedBox(height: 16),
          
          // Adresse complète
          CustomInputField(
            controller: _addressController,
            label: 'Adresse complète',
            hint: 'Ex: Rue 123, Quartier ABC...',
            maxLines: 2,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'L\'adresse est requise';
              }
              return null;
            },
          ),
          
          const SizedBox(height: 16),
          
          // Ville et district
          Row(
            children: [
              Expanded(
                child: CustomInputField(
                  controller: _cityController,
                  label: 'Ville',
                  hint: 'Ex: Cotonou',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomInputField(
                  controller: _districtController,
                  label: 'Quartier',
                  hint: 'Ex: Akpakpa',
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Point de repère
          CustomInputField(
            controller: _landmarkController,
            label: 'Point de repère (optionnel)',
            hint: 'Ex: Près de l\'école primaire...',
          ),
          
          const SizedBox(height: 16),
          
          // Checkbox pour adresse par défaut
          CheckboxListTile(
            value: _isDefault,
            onChanged: (value) {
              setState(() {
                _isDefault = value ?? false;
              });
            },
            title: Text(
              'Définir comme adresse par défaut',
              style: AppTypography.body2.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            activeColor: AppColors.primaryGreen,
          ),
          
          const SizedBox(height: 20),
          
          // Bouton d'ajout
          CustomButton(
            text: 'Ajouter cette adresse',
            onPressed: _addAddress,
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
          text: _addresses.isEmpty ? 'Passer cette étape' : 'Continuer',
          onPressed: _continueToNextStep,
          variant: ButtonVariant.primary,
          size: ButtonSize.large,
          isFullWidth: true,
        ),
        
        if (_addresses.isNotEmpty) ...[
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
