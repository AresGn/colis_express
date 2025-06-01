/// Noms des routes centralisés pour éviter les erreurs de typage
/// et faciliter la maintenance de la navigation
class RouteNames {
  // Routes d'authentification
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';

  // Routes principales pour les clients (expéditeurs/destinataires)
  static const String customerHome = '/customer/home';
  static const String newParcel = '/customer/new-parcel';
  static const String transportSelection = '/customer/transport-selection';
  static const String confirmation = '/customer/confirmation';
  static const String payment = '/customer/payment';
  static const String paymentConfirmation = '/customer/payment-confirmation';

  // Routes de suivi
  static const String tracking = '/tracking';
  static const String trackingDetails = '/tracking/details';
  static const String trackingMap = '/tracking/map';
  static const String deliveryConfirmed = '/tracking/delivery-confirmed';

  // Routes de profil et paramètres
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String help = '/help';
  static const String contacts = '/contacts';

  // Routes pour les transporteurs (à implémenter)
  static const String transporterHome = '/transporter/home';
  static const String transporterDashboard = '/transporter/dashboard';
  static const String transporterOrders = '/transporter/orders';
  static const String transporterOrderDetails = '/transporter/orders/details';
  static const String transporterDelivery = '/transporter/delivery';
  static const String transporterEarnings = '/transporter/earnings';
  static const String transporterProfile = '/transporter/profile';

  // Routes d'erreur
  static const String notFound = '/404';
  static const String error = '/error';

  // Méthodes utilitaires pour la construction de routes avec paramètres
  static String trackingDetailsWithId(String trackingId) =>
      '$trackingDetails?id=$trackingId';

  static String transporterOrderDetailsWithId(String orderId) =>
      '$transporterOrderDetails?id=$orderId';

  static String paymentWithAmount(double amount) => '$payment?amount=$amount';

  // Validation des routes
  static bool isValidRoute(String route) {
    return _allRoutes.contains(route.split('?').first);
  }

  // Liste de toutes les routes pour validation
  static const List<String> _allRoutes = [
    splash,
    welcome,
    login,
    register,
    customerHome,
    newParcel,
    transportSelection,
    confirmation,
    payment,
    paymentConfirmation,
    tracking,
    trackingDetails,
    trackingMap,
    deliveryConfirmed,
    profile,
    settings,
    help,
    contacts,
    transporterHome,
    transporterDashboard,
    transporterOrders,
    transporterOrderDetails,
    transporterDelivery,
    transporterEarnings,
    transporterProfile,
    notFound,
    error,
  ];

  // Routes publiques (accessibles sans authentification)
  static const List<String> publicRoutes = [
    splash,
    welcome,
    login,
    register,
    tracking,
    trackingDetails,
    trackingMap,
    deliveryConfirmed,
  ];

  // Routes protégées (nécessitent une authentification)
  static const List<String> protectedRoutes = [
    customerHome,
    newParcel,
    transportSelection,
    confirmation,
    payment,
    paymentConfirmation,
    profile,
    settings,
    help,
    contacts,
  ];

  // Routes spécifiques aux transporteurs
  static const List<String> transporterRoutes = [
    transporterHome,
    transporterDashboard,
    transporterOrders,
    transporterOrderDetails,
    transporterDelivery,
    transporterEarnings,
    transporterProfile,
  ];
}
