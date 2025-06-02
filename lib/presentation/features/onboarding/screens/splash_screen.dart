import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/features/onboarding/widgets/splash_logo.dart';
import 'package:agbantche/presentation/features/onboarding/widgets/splash_branding.dart';
import 'package:agbantche/presentation/features/onboarding/widgets/splash_loading_indicator.dart';
import 'package:agbantche/presentation/features/onboarding/widgets/splash_version_tag.dart';
import 'package:agbantche/presentation/features/onboarding/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Ici, vous pourriez ajouter des initialisations d'application,
    // comme la vérification de l'authentification, le chargement des données initiales, etc.

    // Simulation d'un délai de chargement pour l'exemple
    await Future.delayed(const Duration(seconds: 3));

    // Navigation vers l'écran suivant une fois les initialisations terminées
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fond dégradé
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: AppColors.primaryGradient,
                stops: [0.0, 1.0],
              ),
            ),
          ),

          // Contenu principal
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SplashLogo(),
                    SizedBox(height: 32),
                    SplashBranding(),
                    SizedBox(height: 32),
                    SplashLoadingIndicator(),
                  ],
                ),
              ),
            ),
          ),

          // Version en bas de l'écran
          const SplashVersionTag(),
        ],
      ),
    );
  }
}
