import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/theme/app_typography.dart';
import 'package:agbantche/presentation/core/widgets/custom_button.dart';
import 'package:agbantche/presentation/core/navigation/route_names.dart';
import 'package:agbantche/presentation/features/onboarding/widgets/setup_progress_indicator.dart';
import 'package:agbantche/domain/models/delivery_preferences.dart';

/// Écran de configuration des préférences de livraison
class DeliveryPreferencesSetupScreen extends StatefulWidget {
  const DeliveryPreferencesSetupScreen({super.key});

  @override
  State<DeliveryPreferencesSetupScreen> createState() =>
      _DeliveryPreferencesSetupScreenState();
}

class _DeliveryPreferencesSetupScreenState
    extends State<DeliveryPreferencesSetupScreen> {
  DeliveryType _selectedDeliveryType = DeliveryType.standard;
  PreferredTimeSlot _selectedTimeSlot = PreferredTimeSlot.anytime;
  bool _allowWeekendDelivery = true;
  bool _requireSignature = false;
  bool _allowNeighborDelivery = true;

  void _continueToNextStep() {
    // TODO: Sauvegarder les préférences
    Navigator.pushNamed(context, RouteNames.notificationPreferencesSetup);
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
          'Préférences de livraison',
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
                currentStep: 4,
                totalSteps: 6,
                stepTitle: 'Vos préférences de livraison',
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
                        'Configurez vos préférences pour une expérience de livraison personnalisée.',
                        style: AppTypography.body1.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Type de livraison préféré
                      _buildDeliveryTypeSection(),

                      const SizedBox(height: 32),

                      // Créneaux horaires
                      _buildTimeSlotSection(),

                      const SizedBox(height: 32),

                      // Options supplémentaires
                      _buildAdditionalOptionsSection(),
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

  Widget _buildDeliveryTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Type de livraison préféré',
          style: AppTypography.h4.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 16),

        ...DeliveryType.values.map((type) => _buildDeliveryTypeOption(type)),
      ],
    );
  }

  Widget _buildDeliveryTypeOption(DeliveryType type) {
    final isSelected = _selectedDeliveryType == type;

    String title;
    String description;
    IconData icon;

    switch (type) {
      case DeliveryType.standard:
        title = 'Livraison standard';
        description = 'Délai normal, prix équilibré';
        icon = Icons.local_shipping_outlined;
        break;
      case DeliveryType.express:
        title = 'Livraison express';
        description = 'Livraison rapide, prix plus élevé';
        icon = Icons.flash_on_outlined;
        break;
      case DeliveryType.economy:
        title = 'Livraison économique';
        description = 'Prix réduit, délai plus long';
        icon = Icons.savings_outlined;
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedDeliveryType = type;
          });
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color:
                  isSelected ? AppColors.primaryGreen : AppColors.borderLight,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? AppColors.primaryGreen
                          : AppColors.primaryGreen.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: isSelected ? Colors.white : AppColors.primaryGreen,
                  size: 20,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTypography.body1.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      description,
                      style: AppTypography.body2.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              if (isSelected)
                const Icon(
                  Icons.check_circle,
                  color: AppColors.primaryGreen,
                  size: 24,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeSlotSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Créneau horaire préféré',
          style: AppTypography.h4.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 16),

        ...PreferredTimeSlot.values.map((slot) => _buildTimeSlotOption(slot)),
      ],
    );
  }

  Widget _buildTimeSlotOption(PreferredTimeSlot slot) {
    String title;
    String description;

    switch (slot) {
      case PreferredTimeSlot.morning:
        title = 'Matin';
        description = '8h00 - 12h00';
        break;
      case PreferredTimeSlot.afternoon:
        title = 'Après-midi';
        description = '12h00 - 17h00';
        break;
      case PreferredTimeSlot.evening:
        title = 'Soir';
        description = '17h00 - 20h00';
        break;
      case PreferredTimeSlot.anytime:
        title = 'Peu importe';
        description = 'Disponible toute la journée';
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: RadioListTile<PreferredTimeSlot>(
        value: slot,
        groupValue: _selectedTimeSlot,
        onChanged: (value) {
          setState(() {
            _selectedTimeSlot = value!;
          });
        },
        title: Text(
          title,
          style: AppTypography.body1.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        subtitle: Text(
          description,
          style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
        ),
        activeColor: AppColors.primaryGreen,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }

  Widget _buildAdditionalOptionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Options supplémentaires',
          style: AppTypography.h4.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 16),

        // Livraison weekend
        SwitchListTile(
          value: _allowWeekendDelivery,
          onChanged: (value) {
            setState(() {
              _allowWeekendDelivery = value;
            });
          },
          title: Text(
            'Livraison le weekend',
            style: AppTypography.body1.copyWith(color: AppColors.textPrimary),
          ),
          subtitle: Text(
            'Autoriser les livraisons le samedi et dimanche',
            style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
          ),
          activeColor: AppColors.primaryGreen,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        ),

        // Signature requise
        SwitchListTile(
          value: _requireSignature,
          onChanged: (value) {
            setState(() {
              _requireSignature = value;
            });
          },
          title: Text(
            'Signature requise',
            style: AppTypography.body1.copyWith(color: AppColors.textPrimary),
          ),
          subtitle: Text(
            'Exiger une signature lors de la livraison',
            style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
          ),
          activeColor: AppColors.primaryGreen,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        ),

        // Livraison chez le voisin
        SwitchListTile(
          value: _allowNeighborDelivery,
          onChanged: (value) {
            setState(() {
              _allowNeighborDelivery = value;
            });
          },
          title: Text(
            'Livraison chez le voisin',
            style: AppTypography.body1.copyWith(color: AppColors.textPrimary),
          ),
          subtitle: Text(
            'Autoriser la livraison chez un voisin en cas d\'absence',
            style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
          ),
          activeColor: AppColors.primaryGreen,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        ),
      ],
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
          onPressed: _continueToNextStep,
          child: Text(
            'Passer cette étape',
            style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
          ),
        ),
      ],
    );
  }
}
