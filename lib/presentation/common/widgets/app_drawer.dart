import 'package:flutter/material.dart';
import 'package:agbantche/presentation/features/tracking/screens/tracking_screen.dart';
import 'package:agbantche/presentation/features/payment/screens/payment_screen.dart';
import 'package:agbantche/presentation/features/auth/widgets/user_type_selector.dart'
    show UserType;

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF008751)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: Text('👤', style: TextStyle(fontSize: 32)),
                ),
                SizedBox(height: 12),
                Text(
                  'Jean Dupont',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Accueil'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profil'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.archive_outlined),
            title: const Text('Mes livraisons'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const TrackingScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment_outlined),
            title: const Text('Paiement'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (context) => PaymentScreen(
                        amount:
                            0.0, // Valeur par défaut ou à récupérer dynamiquement
                        orderId: 'preview', // ID temporaire pour l'aperçu
                        userType:
                            UserType
                                .expediteur, // Type d'utilisateur par défaut
                      ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Déconnexion'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
