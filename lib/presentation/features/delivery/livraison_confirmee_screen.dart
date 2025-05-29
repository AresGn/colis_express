import 'package:flutter/material.dart';
import 'package:benin_express/presentation/features/delivery/widgets/success_animation.dart';
import 'package:benin_express/presentation/features/delivery/widgets/info_card.dart';
import 'package:benin_express/presentation/features/delivery/widgets/detail_row.dart';
import 'package:benin_express/presentation/features/delivery/widgets/action_buttons.dart';

/// u00c9cran de confirmation de livraison ru00e9ussie
class LivraisonConfirmeeScreen extends StatelessWidget {
  const LivraisonConfirmeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Fond gu00e9nu00e9ral
      appBar: AppBar(
        title: const Text('Livraison confirmu00e9e'),
        backgroundColor: Colors.white, // En-tu00eate fixe blanc
        elevation: 1,
        centerTitle: true,
        foregroundColor: const Color(0xFF1F2937), // Texte sombre
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Animation de succu00e8s
            const SuccessAnimation(),

            // Message principal
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Livraison ru00e9ussie !',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF008751),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Le colis #CEB-2415 u00e0 destination de Abomey-Calavi a u00e9tu00e9 livru00e9. Merci pour votre confiance avec Colis Express Bu00e9nin.',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Du00e9tails de la livraison
            InfoCard(
              title: 'Du00e9tails de la livraison',
              icon: Icons.local_shipping,
              iconColor: const Color(0xFF10B981),
              content: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 2.5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: const [
                  DetailRow(label: 'Nu00b0 de suivi', value: 'CEB-2415'),
                  DetailRow(label: 'Date', value: '29 Mai, 2025'),
                  DetailRow(label: 'Heure', value: '14:35'),
                  DetailRow(label: 'Mode', value: 'Moto'),
                  DetailRow(label: 'Colis', value: 'Electronique'),
                  DetailRow(label: 'Poids', value: '2.5 kg'),
                ],
              ),
            ),

            // Adresses
            InfoCard(
              title: 'Adresses',
              icon: Icons.location_on,
              iconColor: const Color(0xFF3B82F6),
              content: Column(
                children: [
                  // Du00e9part
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.circle,
                        size: 16,
                        color: Color(0xFF10B981),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Point de du00e9part',
                              style: TextStyle(
                                color: Color(0xFF6B7280),
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '123 Rue du Commerce, Akpakpa, Cotonou',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  // Ligne verticale entre les points
                  Row(
                    children: [
                      const SizedBox(width: 8),
                      Container(
                        height: 16,
                        width: 1,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const SizedBox(height: 2),
                  // Arrivu00e9e
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Color(0xFFEF4444),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Destination',
                              style: TextStyle(
                                color: Color(0xFF6B7280),
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '456 Avenue des Palmiers, Calavi, Cotonou',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Paiement
            InfoCard(
              title: 'Paiement',
              icon: Icons.payment,
              iconColor: const Color(0xFFF59E0B),
              content: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Mu00e9thode'),
                      Text(
                        'Carte Visa ****4528',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Montant'),
                      Text(
                        '15 000 XOF',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Boutons d'action
            ActionButtons(
              onHomePressed: () {
                // Retour u00e0 l'u00e9cran d'accueil
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/',
                  (route) => false,
                );
              },
              onDownloadPressed: () {
                // TODO: Implu00e9menter l'action Tu00e9lu00e9charger reu00e7u
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tu00e9lu00e9chargement du reu00e7u...'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
