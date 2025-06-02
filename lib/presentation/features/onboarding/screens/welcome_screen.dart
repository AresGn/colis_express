import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/theme/app_typography.dart';
import 'package:agbantche/presentation/core/widgets/custom_button.dart';
import 'package:agbantche/presentation/features/auth/screens/login_screen.dart';
import 'package:agbantche/presentation/features/auth/screens/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.background,
          image: DecorationImage(
            image: const AssetImage('assets/images/onboarding_bg.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.3),
              BlendMode.darken,
            ),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo et titre en haut
                const Spacer(flex: 1),
                _buildHeader(),
                const Spacer(flex: 2),

                // Texte de bienvenue
                _buildWelcomeText(),
                const SizedBox(height: 40),

                // Boutons d'action
                _buildActionButtons(context),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        // Logo
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Center(
            child: Text('📦', style: TextStyle(fontSize: 40)),
          ),
        ),
        const SizedBox(height: 16),

        // Nom de l'application
        Text(
          'Agbantché',
          style: AppTypography.h1.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      children: [
        Text(
          'Bienvenue',
          style: AppTypography.h1.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 32,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'La solution de livraison de colis la plus rapide et sécurisée du Bénin',
          textAlign: TextAlign.center,
          style: AppTypography.body1.copyWith(
            color: Colors.white.withOpacity(0.9),
            height: 1.5,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 1),
                blurRadius: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Bouton de connexion
        CustomButton(
          text: 'Se connecter',
          onPressed:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              ),
          variant: ButtonVariant.primary,
          size: ButtonSize.large,
        ),
        const SizedBox(height: 16),

        // Bouton d'inscription
        CustomButton(
          text: 'Créer un compte',
          onPressed:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterScreen()),
              ),
          variant: ButtonVariant.outline,
          size: ButtonSize.large,
        ),
      ],
    );
  }
}
