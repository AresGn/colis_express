import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/theme/app_typography.dart';
import 'package:agbantche/presentation/core/widgets/custom_button.dart';
import 'package:agbantche/presentation/core/widgets/custom_input_field.dart';
import 'package:agbantche/presentation/core/navigation/route_names.dart';
import 'package:agbantche/presentation/features/onboarding/widgets/setup_progress_indicator.dart';

/// Écran de configuration des informations personnelles
class PersonalInfoSetupScreen extends StatefulWidget {
  const PersonalInfoSetupScreen({super.key});

  @override
  State<PersonalInfoSetupScreen> createState() => _PersonalInfoSetupScreenState();
}

class _PersonalInfoSetupScreenState extends State<PersonalInfoSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _continueToNextStep() {
    if (_formKey.currentState!.validate()) {
      // TODO: Sauvegarder les données
      Navigator.pushNamed(context, RouteNames.addressSetup);
    }
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
          'Informations personnelles',
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
                currentStep: 1,
                totalSteps: 6,
                stepTitle: 'Parlez-nous de vous',
              ),
              
              const SizedBox(height: 32),
              
              // Formulaire
              Expanded(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Description
                        Text(
                          'Ces informations nous aideront à personnaliser votre expérience et à faciliter vos livraisons.',
                          style: AppTypography.body1.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        
                        const SizedBox(height: 32),
                        
                        // Prénom
                        CustomInputField(
                          controller: _firstNameController,
                          label: 'Prénom',
                          hint: 'Entrez votre prénom',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Le prénom est requis';
                            }
                            if (value.trim().length < 2) {
                              return 'Le prénom doit contenir au moins 2 caractères';
                            }
                            return null;
                          },
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // Nom de famille
                        CustomInputField(
                          controller: _lastNameController,
                          label: 'Nom de famille',
                          hint: 'Entrez votre nom de famille',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Le nom de famille est requis';
                            }
                            if (value.trim().length < 2) {
                              return 'Le nom doit contenir au moins 2 caractères';
                            }
                            return null;
                          },
                        ),
                        
                        const SizedBox(height: 20),
                        
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
                            // Validation simple pour les numéros béninois
                            final cleanPhone = value.replaceAll(RegExp(r'[^\d]'), '');
                            if (cleanPhone.length < 8) {
                              return 'Numéro de téléphone invalide';
                            }
                            return null;
                          },
                        ),
                        
                        const SizedBox(height: 20),
                        
                        // Email (optionnel)
                        CustomInputField(
                          controller: _emailController,
                          label: 'Email (optionnel)',
                          hint: 'exemple@email.com',
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value != null && value.trim().isNotEmpty) {
                              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                              if (!emailRegex.hasMatch(value.trim())) {
                                return 'Format d\'email invalide';
                              }
                            }
                            return null;
                          },
                        ),
                        
                        const SizedBox(height: 32),
                        
                        // Note informative
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.primaryGreen.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AppColors.primaryGreen.withValues(alpha: 0.2),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: AppColors.primaryGreen,
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Ces informations resteront privées et ne seront utilisées que pour améliorer votre expérience.',
                                  style: AppTypography.body2.copyWith(
                                    color: AppColors.primaryGreen,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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

  Widget _buildActionButtons() {
    return Column(
      children: [
        CustomButton(
          text: 'Continuer',
          onPressed: _continueToNextStep,
          variant: ButtonVariant.primary,
          size: ButtonSize.large,
          isFullWidth: true,
        ),
        
        const SizedBox(height: 12),
        
        TextButton(
          onPressed: () {
            // Passer cette étape
            Navigator.pushNamed(context, RouteNames.addressSetup);
          },
          child: Text(
            'Passer cette étape',
            style: AppTypography.body2.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
