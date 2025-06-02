import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/theme/app_typography.dart';
import 'package:agbantche/presentation/core/widgets/custom_button.dart';
import 'package:agbantche/presentation/core/navigation/route_names.dart';
import 'package:agbantche/presentation/features/onboarding/widgets/setup_progress_indicator.dart';

/// Écran de bienvenue pour le processus d'intégration post-connexion
class SetupWelcomeScreen extends StatelessWidget {
  const SetupWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Indicateur de progression
              const SetupProgressIndicator(currentStep: 0, totalSteps: 6),

              const SizedBox(height: 40),

              // Contenu principal
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icône de bienvenue
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: AppColors.primaryGreen.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.rocket_launch,
                          size: 60,
                          color: AppColors.primaryGreen,
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Titre
                      Text(
                        'Bienvenue sur Agbantché !',
                        style: AppTypography.h1.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 16),

                      // Sous-titre
                      Text(
                        'Configurons votre profil pour une expérience personnalisée',
                        style: AppTypography.body1.copyWith(
                          color: AppColors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 40),

                      // Liste des étapes
                      _buildSetupStepsList(),
                    ],
                  ),
                ),
              ),

              // Boutons d'action
              _buildActionButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSetupStepsList() {
    final steps = [
      {
        'icon': Icons.person_outline,
        'title': 'Informations personnelles',
        'description': 'Nom, téléphone et email',
      },
      {
        'icon': Icons.location_on_outlined,
        'title': 'Adresses de collecte',
        'description': 'Vos lieux fréquents',
      },
      {
        'icon': Icons.contacts_outlined,
        'title': 'Contacts de livraison',
        'description': 'Destinataires fréquents',
      },
      {
        'icon': Icons.local_shipping_outlined,
        'title': 'Préférences de livraison',
        'description': 'Type et horaires préférés',
      },
      {
        'icon': Icons.notifications_outlined,
        'title': 'Notifications',
        'description': 'Restez informé du suivi',
      },
    ];

    return Column(
      children:
          steps
              .map(
                (step) => _buildStepItem(
                  icon: step['icon'] as IconData,
                  title: step['title'] as String,
                  description: step['description'] as String,
                ),
              )
              .toList(),
    );
  }

  Widget _buildStepItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primaryGreen.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColors.primaryGreen, size: 20),
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
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: 'Commencer la configuration',
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.personalInfoSetup);
          },
          variant: ButtonVariant.primary,
          size: ButtonSize.large,
          isFullWidth: true,
        ),

        const SizedBox(height: 12),

        TextButton(
          onPressed: () {
            // Passer l'intégration pour l'instant
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteNames.customerHome,
              (route) => false,
            );
          },
          child: Text(
            'Passer pour l\'instant',
            style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
          ),
        ),
      ],
    );
  }
}
