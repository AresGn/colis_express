import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_theme.dart';
import 'package:benin_express/presentation/features/onboarding/screens/splash_screen.dart';
import 'package:benin_express/domain/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialiser les services
  await ServiceLocator().initialize();

  runApp(const BeninExpressApp());
}

class BeninExpressApp extends StatelessWidget {
  const BeninExpressApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bénin Express',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.light, // Utiliser le thème clair par défaut
      home: const SplashScreen(), // Commencer par l'écran de démarrage
    );
  }
}
