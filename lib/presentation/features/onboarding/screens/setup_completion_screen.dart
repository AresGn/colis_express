import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/theme/app_typography.dart';
import 'package:agbantche/presentation/core/widgets/custom_button.dart';
import 'package:agbantche/presentation/core/navigation/route_names.dart';
import 'package:agbantche/presentation/features/onboarding/widgets/setup_progress_indicator.dart';

/// Écran de finalisation du processus d'intégration
class SetupCompletionScreen extends StatefulWidget {
  const SetupCompletionScreen({super.key});

  @override
  State<SetupCompletionScreen> createState() => _SetupCompletionScreenState();
}

class _SetupCompletionScreenState extends State<SetupCompletionScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.elasticOut),
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.4, 1.0, curve: Curves.easeIn),
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _goToHome() {
    // TODO: Marquer l'intégration comme terminée
    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteNames.customerHome,
      (route) => false,
    );
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
          'Configuration terminée',
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
                currentStep: 6,
                totalSteps: 6,
                stepTitle: 'Félicitations !',
              ),
              
              const SizedBox(height: 40),
              
              // Contenu principal
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Animation de succès
                      AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _scaleAnimation.value,
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: AppColors.success.withValues(alpha: 0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check_circle,
                                size: 60,
                                color: AppColors.success,
                              ),
                            ),
                          );
                        },
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Titre principal
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: Text(
                          'Votre profil est configuré !',
                          style: AppTypography.h1.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Sous-titre
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: Text(
                          'Vous êtes maintenant prêt à utiliser Agbantché pour vos livraisons',
                          style: AppTypography.body1.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // Résumé des configurations
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: _buildConfigurationSummary(),
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // Prochaines étapes
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: _buildNextSteps(),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Boutons d'action
              FadeTransition(
                opacity: _fadeAnimation,
                child: _buildActionButtons(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConfigurationSummary() {
    final completedSteps = [
      {
        'icon': Icons.person_outline,
        'title': 'Profil personnel',
        'description': 'Informations de base configurées',
      },
      {
        'icon': Icons.location_on_outlined,
        'title': 'Adresses',
        'description': 'Points de collecte ajoutés',
      },
      {
        'icon': Icons.contacts_outlined,
        'title': 'Contacts',
        'description': 'Destinataires fréquents sauvegardés',
      },
      {
        'icon': Icons.local_shipping_outlined,
        'title': 'Préférences de livraison',
        'description': 'Options personnalisées définies',
      },
      {
        'icon': Icons.notifications_outlined,
        'title': 'Notifications',
        'description': 'Alertes configurées',
      },
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Configuration terminée',
            style: AppTypography.h4.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          
          const SizedBox(height: 16),
          
          ...completedSteps.map((step) => _buildCompletedStepItem(
            icon: step['icon'] as IconData,
            title: step['title'] as String,
            description: step['description'] as String,
          )),
        ],
      ),
    );
  }

  Widget _buildCompletedStepItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              Icons.check,
              color: AppColors.success,
              size: 16,
            ),
          ),
          
          const SizedBox(width: 12),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.body2.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  description,
                  style: AppTypography.caption.copyWith(
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

  Widget _buildNextSteps() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryGreen.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primaryGreen.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb_outline,
                color: AppColors.primaryGreen,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Prochaines étapes',
                style: AppTypography.h4.copyWith(
                  color: AppColors.primaryGreen,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          Text(
            '• Créez votre première commande de livraison\n'
            '• Explorez les transporteurs disponibles\n'
            '• Suivez vos colis en temps réel\n'
            '• Invitez vos amis à utiliser Agbantché',
            style: AppTypography.body2.copyWith(
              color: AppColors.textPrimary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        CustomButton(
          text: 'Commencer à utiliser Agbantché',
          onPressed: _goToHome,
          variant: ButtonVariant.primary,
          size: ButtonSize.large,
          isFullWidth: true,
        ),
        
        const SizedBox(height: 12),
        
        TextButton(
          onPressed: () {
            // Afficher un guide rapide ou des conseils
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  'Conseils pour bien commencer',
                  style: AppTypography.h4.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                content: Text(
                  'Vous pouvez toujours modifier vos préférences dans les paramètres de l\'application. '
                  'N\'hésitez pas à explorer toutes les fonctionnalités disponibles !',
                  style: AppTypography.body2.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _goToHome();
                    },
                    child: Text(
                      'Compris',
                      style: AppTypography.body2.copyWith(
                        color: AppColors.primaryGreen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          child: Text(
            'Voir les conseils',
            style: AppTypography.body2.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
