import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/navigation/route_names.dart';

/// Énumération des types d'utilisateurs pour la gestion des permissions
enum UserType { guest, customer, transporter, admin }

/// Service de gestion des guards de navigation
/// Contrôle l'accès aux routes en fonction du statut d'authentification et du type d'utilisateur
class RouteGuards {
  // État d'authentification simulé (à remplacer par un vrai service d'auth)
  static bool _isAuthenticated = false;
  static UserType _currentUserType = UserType.guest;

  // Getters pour l'état actuel
  static bool get isAuthenticated => _isAuthenticated;
  static UserType get currentUserType => _currentUserType;

  // Méthodes pour simuler l'authentification (à remplacer par un vrai service)
  static void setAuthenticated(bool authenticated, [UserType? userType]) {
    _isAuthenticated = authenticated;
    if (userType != null) {
      _currentUserType = userType;
    } else if (!authenticated) {
      _currentUserType = UserType.guest;
    }
  }

  /// Vérifie si l'utilisateur peut accéder à une route donnée
  static bool canAccessRoute(String route) {
    final routePath = route.split('?').first; // Enlever les paramètres de query

    // Debug: Afficher l'état d'authentification
    debugPrint('🔐 Vérification d\'accès pour route: $routePath');
    debugPrint('🔐 Authentifié: $_isAuthenticated, Type: $_currentUserType');

    // Routes publiques : toujours accessibles
    if (RouteNames.publicRoutes.contains(routePath)) {
      debugPrint('🔐 Route publique - Accès autorisé');
      return true;
    }

    // Routes protégées : nécessitent une authentification
    if (RouteNames.protectedRoutes.contains(routePath)) {
      final hasAccess =
          _isAuthenticated &&
          (_currentUserType == UserType.customer ||
              _currentUserType == UserType.admin);
      debugPrint('🔐 Route protégée - Accès: $hasAccess');
      return hasAccess;
    }

    // Routes transporteur : nécessitent d'être connecté en tant que transporteur
    if (RouteNames.transporterRoutes.contains(routePath)) {
      final hasAccess =
          _isAuthenticated &&
          (_currentUserType == UserType.transporter ||
              _currentUserType == UserType.admin);
      debugPrint('🔐 Route transporteur - Accès: $hasAccess');
      return hasAccess;
    }

    // Route inconnue : refuser l'accès
    debugPrint('🔐 Route inconnue - Accès refusé');
    return false;
  }

  /// Retourne la route de redirection appropriée si l'accès est refusé
  static String getRedirectRoute(String attemptedRoute) {
    final routePath = attemptedRoute.split('?').first;

    // Si pas authentifié et tentative d'accès à une route protégée
    if (!_isAuthenticated &&
        (RouteNames.protectedRoutes.contains(routePath) ||
            RouteNames.transporterRoutes.contains(routePath))) {
      return RouteNames.login;
    }

    // Si authentifié mais mauvais type d'utilisateur
    if (_isAuthenticated) {
      if (RouteNames.transporterRoutes.contains(routePath) &&
          _currentUserType != UserType.transporter &&
          _currentUserType != UserType.admin) {
        return RouteNames.customerHome;
      }

      if (RouteNames.protectedRoutes.contains(routePath) &&
          _currentUserType != UserType.customer &&
          _currentUserType != UserType.admin) {
        return RouteNames.transporterHome;
      }
    }

    // Route par défaut en cas d'erreur
    return RouteNames.welcome;
  }

  /// Détermine la route d'accueil appropriée selon le type d'utilisateur
  static String getHomeRoute() {
    if (!_isAuthenticated) {
      return RouteNames.welcome;
    }

    switch (_currentUserType) {
      case UserType.customer:
        return RouteNames.customerHome;
      case UserType.transporter:
        return RouteNames.transporterHome;
      case UserType.admin:
        return RouteNames
            .customerHome; // Les admins voient l'interface client par défaut
      case UserType.guest:
      default:
        return RouteNames.welcome;
    }
  }

  /// Vérifie si l'utilisateur peut effectuer une action spécifique
  static bool canPerformAction(String action) {
    switch (action) {
      case 'create_parcel':
        return _isAuthenticated &&
            (_currentUserType == UserType.customer ||
                _currentUserType == UserType.admin);

      case 'accept_order':
        return _isAuthenticated &&
            (_currentUserType == UserType.transporter ||
                _currentUserType == UserType.admin);

      case 'track_parcel':
        return true; // Accessible à tous

      case 'manage_users':
        return _isAuthenticated && _currentUserType == UserType.admin;

      default:
        return false;
    }
  }

  /// Middleware pour vérifier l'accès avant la navigation
  static bool checkAccess(String route, BuildContext context) {
    if (canAccessRoute(route)) {
      return true;
    }

    // Rediriger vers la route appropriée
    final redirectRoute = getRedirectRoute(route);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushReplacementNamed(redirectRoute);
    });

    return false;
  }

  /// Déconnexion : remet l'état à guest
  static void logout() {
    _isAuthenticated = false;
    _currentUserType = UserType.guest;
  }
}
