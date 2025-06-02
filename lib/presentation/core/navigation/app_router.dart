import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/navigation/route_names.dart';
import 'package:agbantche/presentation/core/navigation/route_guards.dart';

// Import des écrans existants
import 'package:agbantche/presentation/features/onboarding/screens/splash_screen.dart';
import 'package:agbantche/presentation/features/onboarding/screens/welcome_screen.dart';
import 'package:agbantche/presentation/features/auth/screens/login_screen.dart';
import 'package:agbantche/presentation/features/auth/screens/register_screen.dart';
import 'package:agbantche/presentation/features/home/screens/home_screen.dart';
import 'package:agbantche/presentation/features/parcels/screens/new_parcel_screen.dart';
import 'package:agbantche/presentation/features/parcels/screens/transport_selection_screen.dart';
import 'package:agbantche/presentation/features/parcels/screens/confirmation_screen.dart';
import 'package:agbantche/presentation/features/payment/screens/payment_screen.dart';
import 'package:agbantche/presentation/features/payment/screens/payment_confirmation_screen.dart';
import 'package:agbantche/presentation/features/tracking/screens/tracking_screen.dart';
import 'package:agbantche/presentation/features/tracking/screens/tracking_details_screen.dart';
import 'package:agbantche/presentation/features/tracking/screens/tracking_map_screen.dart';
import 'package:agbantche/presentation/features/delivery/livraison_confirmee_screen.dart';
import 'package:agbantche/presentation/features/contacts/screens/contacts_screen.dart';
import 'package:agbantche/presentation/features/onboarding/screens/setup_welcome_screen.dart';
import 'package:agbantche/presentation/features/onboarding/screens/personal_info_setup_screen.dart';
import 'package:agbantche/presentation/features/onboarding/screens/address_setup_screen.dart';
import 'package:agbantche/presentation/features/onboarding/screens/contacts_setup_screen.dart';
import 'package:agbantche/presentation/features/onboarding/screens/delivery_preferences_setup_screen.dart';
import 'package:agbantche/presentation/features/onboarding/screens/notification_preferences_setup_screen.dart';
import 'package:agbantche/presentation/features/onboarding/screens/setup_completion_screen.dart';
import 'package:agbantche/presentation/features/auth/widgets/user_type_selector.dart'
    as AuthUserType;

/// Router principal de l'application avec gestion des guards et des routes nommées
class AppRouter {
  /// Génère les routes de l'application avec vérification des permissions
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String routeName = settings.name ?? RouteNames.notFound;
    final Map<String, dynamic> arguments =
        settings.arguments as Map<String, dynamic>? ?? {};

    // Vérifier l'accès à la route
    if (!RouteGuards.canAccessRoute(routeName)) {
      final redirectRoute = RouteGuards.getRedirectRoute(routeName);
      return _buildRoute(
        _getScreenForRoute(redirectRoute, {}),
        settings: RouteSettings(name: redirectRoute),
      );
    }

    // Construire la route demandée
    final Widget screen = _getScreenForRoute(routeName, arguments);
    return _buildRoute(screen, settings: settings);
  }

  /// Retourne l'écran correspondant à une route donnée
  static Widget _getScreenForRoute(
    String routeName,
    Map<String, dynamic> arguments,
  ) {
    switch (routeName) {
      // Routes d'authentification
      case RouteNames.splash:
        return const SplashScreen();

      case RouteNames.welcome:
        return const WelcomeScreen();

      case RouteNames.login:
        return const LoginScreen();

      case RouteNames.register:
        return const RegisterScreen();

      // Routes d'intégration post-connexion
      case RouteNames.setupWelcome:
        return const SetupWelcomeScreen();

      case RouteNames.personalInfoSetup:
        return const PersonalInfoSetupScreen();

      case RouteNames.addressSetup:
        return const AddressSetupScreen();

      case RouteNames.contactsSetup:
        return const ContactsSetupScreen();

      case RouteNames.deliveryPreferencesSetup:
        return const DeliveryPreferencesSetupScreen();

      case RouteNames.notificationPreferencesSetup:
        return const NotificationPreferencesSetupScreen();

      case RouteNames.setupCompletion:
        return const SetupCompletionScreen();

      // Routes principales pour les clients
      case RouteNames.customerHome:
        // Debug: Afficher les arguments reçus
        debugPrint(
          '🏠 Navigation vers customerHome avec arguments: $arguments',
        );
        return HomeScreen(
          userType:
              arguments['userType'] as AuthUserType.UserType? ??
              AuthUserType.UserType.customer,
        );

      case RouteNames.newParcel:
        return NewParcelScreen(
          userType:
              arguments['userType'] as AuthUserType.UserType? ??
              AuthUserType.UserType.customer,
        );

      case RouteNames.transportSelection:
        return const TransportSelectionScreen();

      case RouteNames.confirmation:
        return ConfirmationScreen(
          trackingNumber: arguments['trackingNumber'] as String? ?? 'CEB-0000',
        );

      case RouteNames.payment:
        return PaymentScreen(
          amount: arguments['amount'] as double? ?? 0.0,
          orderId: arguments['orderId'] as String? ?? '',
          userType:
              arguments['userType'] as AuthUserType.UserType? ??
              AuthUserType.UserType.customer,
        );

      case RouteNames.paymentConfirmation:
        return PaymentConfirmationScreen(
          amount: arguments['amount'] as double? ?? 0.0,
          orderId: arguments['orderId'] as String? ?? '',
          paymentMethod: arguments['paymentMethod'] as String? ?? '',
          userType:
              arguments['userType'] as AuthUserType.UserType? ??
              AuthUserType.UserType.customer,
        );

      // Routes de suivi
      case RouteNames.tracking:
        return const TrackingScreen();

      case RouteNames.trackingDetails:
        return TrackingDetailsScreen(
          trackingNumber: arguments['trackingNumber'] as String? ?? '',
        );

      case RouteNames.trackingMap:
        return TrackingMapScreen(
          trackingNumber: arguments['trackingNumber'] as String? ?? '',
        );

      case RouteNames.deliveryConfirmed:
        return const LivraisonConfirmeeScreen();

      // Routes de profil et paramètres
      case RouteNames.profile:
        return _buildPlaceholderScreen(
          'Profil',
          'Gestion du profil utilisateur',
        );

      case RouteNames.settings:
        return _buildPlaceholderScreen(
          'Paramètres',
          'Configuration de l\'application',
        );

      case RouteNames.help:
        return _buildPlaceholderScreen('Aide', 'Centre d\'aide et support');

      case RouteNames.contacts:
        return const ContactsScreen();

      // Routes transporteur (placeholders pour l'implémentation future)
      case RouteNames.transporterHome:
        return _buildPlaceholderScreen(
          'Accueil Transporteur',
          'Interface transporteur à implémenter',
        );

      case RouteNames.transporterDashboard:
        return _buildPlaceholderScreen(
          'Dashboard Transporteur',
          'Tableau de bord transporteur',
        );

      case RouteNames.transporterOrders:
        return _buildPlaceholderScreen(
          'Commandes',
          'Liste des commandes disponibles',
        );

      // Routes d'erreur
      case RouteNames.notFound:
        return _buildErrorScreen(
          'Page non trouvée',
          'La page demandée n\'existe pas.',
        );

      case RouteNames.error:
        return _buildErrorScreen(
          'Erreur',
          arguments['message'] as String? ?? 'Une erreur est survenue.',
        );

      // Route par défaut
      default:
        return _buildErrorScreen(
          'Route inconnue',
          'Route non définie: $routeName',
        );
    }
  }

  /// Construit une route avec les paramètres appropriés
  static PageRoute<dynamic> _buildRoute(
    Widget screen, {
    RouteSettings? settings,
  }) {
    return MaterialPageRoute(builder: (_) => screen, settings: settings);
  }

  /// Construit un écran placeholder pour les fonctionnalités non implémentées
  static Widget _buildPlaceholderScreen(String title, String description) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF008751),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.construction,
                size: 64,
                color: Color(0xFF008751),
              ),
              const SizedBox(height: 24),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                description,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed:
                    () => Navigator.of(navigatorKey.currentContext!).pop(),
                child: const Text('Retour'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Construit un écran d'erreur
  static Widget _buildErrorScreen(String title, String message) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFFE8112D),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: Color(0xFFE8112D),
              ),
              const SizedBox(height: 24),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                message,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed:
                    () => Navigator.of(
                      navigatorKey.currentContext!,
                    ).pushNamedAndRemoveUntil(
                      RouteNames.welcome,
                      (route) => false,
                    ),
                child: const Text('Retour à l\'accueil'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Clé globale pour le navigator (nécessaire pour la navigation programmatique)
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
