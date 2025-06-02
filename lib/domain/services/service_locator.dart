import 'package:agbantche/domain/services/auth_service.dart';
import 'package:agbantche/domain/services/parcel_service.dart';
import 'package:agbantche/domain/services/order_service.dart';

/// Service Locator pour faciliter l'accès aux services
class ServiceLocator {
  // Singleton pattern
  static final ServiceLocator _instance = ServiceLocator._internal();

  factory ServiceLocator() {
    return _instance;
  }

  ServiceLocator._internal();

  // Services
  final AuthService authService = AuthService();
  final ParcelService parcelService = ParcelService();
  final OrderService orderService = OrderService();

  // Méthode d'initialisation (pourrait être utilisée pour configurer les services)
  Future<void> initialize() async {
    // Initialisation des services, si nécessaire
    // Par exemple, charger des configurations, configurer des API, etc.
    await Future.delayed(const Duration(milliseconds: 100));
  }
}
