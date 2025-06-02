import 'package:agbantche/domain/models/user.dart';

/// Service responsable de l'authentification des utilisateurs
class AuthService {
  // Singleton pattern
  static final AuthService _instance = AuthService._internal();

  factory AuthService() {
    return _instance;
  }

  AuthService._internal();

  // Utilisateur actuellement connecté9
  User? _currentUser;

  // Getters
  User? get currentUser => _currentUser;
  bool get isAuthenticated => _currentUser != null;

  // Mé9thode pour connecter un utilisateur
  Future<User> login({required String email, required String password}) async {
    // Simulation d'un appel API
    await Future.delayed(const Duration(seconds: 1));

    // Dans une vraie application, cela vé9rifierait les identifiants
    // Pour l'exemple, nous retournons un utilisateur fictif
    _currentUser = User(
      id: 'u-12345',
      name: 'Jean Dupont',
      phoneNumber: '+229 97123456',
      email: email,
      profileImageUrl: null,
      role: UserRole.customer,
      isActive: true,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      lastLogin: DateTime.now(),
      savedAddresses: [
        Address(
          id: 'a-12345',
          label: 'Domicile',
          street: 'Quartier Akpakpa',
          city: 'Cotonou',
          state: 'Littoral',
          country: 'Bé9nin',
          isDefault: true,
        ),
        Address(
          id: 'a-12346',
          label: 'Bureau',
          street: 'Boulevard Saint-Michel',
          city: 'Cotonou',
          state: 'Littoral',
          country: 'Bé9nin',
          isDefault: false,
        ),
      ],
    );

    return _currentUser!;
  }

  // Mé9thode pour inscrire un nouvel utilisateur
  Future<User> register({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    // Simulation d'un appel API
    await Future.delayed(const Duration(seconds: 1));

    // Dans une vraie application, cela cré9erait un nouvel utilisateur
    // Pour l'exemple, nous retournons un utilisateur fictif
    _currentUser = User(
      id: 'u-${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      phoneNumber: phoneNumber,
      email: email,
      profileImageUrl: null,
      role: UserRole.customer,
      isActive: true,
      createdAt: DateTime.now(),
      lastLogin: DateTime.now(),
      savedAddresses: [],
    );

    return _currentUser!;
  }

  // Mé9thode pour dé9connecter l'utilisateur
  Future<void> logout() async {
    // Simulation d'un appel API
    await Future.delayed(const Duration(milliseconds: 500));

    _currentUser = null;
  }

  // Mé9thode pour ré9cupé9rer le mot de passe
  Future<void> forgotPassword(String email) async {
    // Simulation d'un appel API
    await Future.delayed(const Duration(seconds: 1));

    // Dans une vraie application, cela enverrait un email de ré9initialisation
    // Pour l'exemple, nous ne faisons rien de particulier
  }

  // Mé9thode pour mettre é0 jour le profil utilisateur
  Future<User> updateProfile({
    required String userId,
    String? name,
    String? phoneNumber,
    String? email,
    String? profileImageUrl,
  }) async {
    // Simulation d'un appel API
    await Future.delayed(const Duration(seconds: 1));

    if (_currentUser == null) {
      throw Exception('Utilisateur non connecté9');
    }

    // Mettre é0 jour les informations de l'utilisateur
    _currentUser = User(
      id: _currentUser!.id,
      name: name ?? _currentUser!.name,
      phoneNumber: phoneNumber ?? _currentUser!.phoneNumber,
      email: email ?? _currentUser!.email,
      profileImageUrl: profileImageUrl ?? _currentUser!.profileImageUrl,
      role: _currentUser!.role,
      isActive: _currentUser!.isActive,
      createdAt: _currentUser!.createdAt,
      lastLogin: _currentUser!.lastLogin,
      savedAddresses: _currentUser!.savedAddresses,
    );

    return _currentUser!;
  }

  // Mé9thode pour ajouter une adresse au profil utilisateur
  Future<User> addAddress({
    required String label,
    required String street,
    required String city,
    required String state,
    required String country,
    String? postalCode,
    bool isDefault = false,
    double? latitude,
    double? longitude,
  }) async {
    // Simulation d'un appel API
    await Future.delayed(const Duration(seconds: 1));

    if (_currentUser == null) {
      throw Exception('Utilisateur non connecté9');
    }

    // Cré9er une nouvelle adresse
    final newAddress = Address(
      id: 'a-${DateTime.now().millisecondsSinceEpoch}',
      label: label,
      street: street,
      city: city,
      state: state,
      country: country,
      postalCode: postalCode,
      isDefault: isDefault,
      latitude: latitude,
      longitude: longitude,
    );

    // Mettre é0 jour la liste d'adresses
    final addresses = _currentUser!.savedAddresses ?? [];

    // Si la nouvelle adresse est dé9finie comme par dé9faut, mettre é0 jour les autres adresses
    if (isDefault) {
      for (int i = 0; i < addresses.length; i++) {
        if (addresses[i].isDefault) {
          addresses[i] = Address(
            id: addresses[i].id,
            label: addresses[i].label,
            street: addresses[i].street,
            city: addresses[i].city,
            state: addresses[i].state,
            country: addresses[i].country,
            postalCode: addresses[i].postalCode,
            isDefault: false,
            latitude: addresses[i].latitude,
            longitude: addresses[i].longitude,
          );
        }
      }
    }

    addresses.add(newAddress);

    // Mettre é0 jour l'utilisateur
    _currentUser = User(
      id: _currentUser!.id,
      name: _currentUser!.name,
      phoneNumber: _currentUser!.phoneNumber,
      email: _currentUser!.email,
      profileImageUrl: _currentUser!.profileImageUrl,
      role: _currentUser!.role,
      isActive: _currentUser!.isActive,
      createdAt: _currentUser!.createdAt,
      lastLogin: _currentUser!.lastLogin,
      savedAddresses: addresses,
    );

    return _currentUser!;
  }
}
