import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_theme.dart';
import 'package:agbantche/presentation/core/navigation/app_router.dart';
import 'package:agbantche/presentation/core/navigation/route_names.dart';
import 'package:agbantche/domain/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialiser les services
  await ServiceLocator().initialize();

  runApp(const AgbantcheApp());
}

class AgbantcheApp extends StatelessWidget {
  const AgbantcheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agbantché',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.light,

      // Configuration du système de navigation centralisé
      navigatorKey: navigatorKey,
      initialRoute: RouteNames.splash,
      onGenerateRoute: AppRouter.generateRoute,

      // Gestion des routes inconnues
      onUnknownRoute:
          (settings) => AppRouter.generateRoute(
            RouteSettings(
              name: RouteNames.notFound,
              arguments: settings.arguments,
            ),
          ),
    );
  }
}
