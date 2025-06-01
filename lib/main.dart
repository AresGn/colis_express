import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_theme.dart';
import 'package:benin_express/presentation/core/navigation/app_router.dart';
import 'package:benin_express/presentation/core/navigation/route_names.dart';
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
