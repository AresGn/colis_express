import 'package:flutter/material.dart';

class LivraisonConfirmeeScreen extends StatelessWidget {
  const LivraisonConfirmeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Fond général
      appBar: AppBar(
        title: const Text('Livraison confirmée'),
        backgroundColor: Colors.white, // En-tête fixe blanc
        elevation: 1,
        centerTitle: true,
        foregroundColor: const Color(0xFF1F2937), // Texte sombre
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Espace pour l'AppBar si extendBodyBehindAppBar n'est pas utilisé
            // SizedBox(height: AppBar().preferredSize.height),

            // Animation de succès (simplifiée pour l'instant)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Anneaux animés (simulés avec des containers)
                    Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF10B981).withOpacity(0.2),
                          width: 8,
                        ),
                      ),
                    ),
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF10B981).withOpacity(0.3),
                          width: 8,
                        ),
                      ),
                    ),
                    // Cercle vert dégradé et icône check
                    Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Color(0xFF008751), Color(0xFF22C55E)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 60, // Taille ajustée
                      ),
                    ),
                  ],
                ),
              ),
            ),

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
                    'Livraison réussie !',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF008751),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Le colis #CEB-2415 à destination de Abomey-Calavi a été livré. Merci pour votre confiance avec Colis Express Bénin.',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Détails de livraison (Carte blanche)
            _buildInfoCard(
              title: 'Détails de livraison',
              icon: Icons.archive,
              iconColor: const Color(0xFF008751),
              content: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio:
                    2.0, // Further decreased aspect ratio to give more vertical space
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: [
                  _buildDetailRow('Numéro de colis', '#CEB-2415'),
                  _buildDetailRow('Destination', 'Abomey-Calavi'),
                  _buildDetailRow('Date de livraison', 'Aujourd\'hui, 15:42'),
                  _buildDetailRow('Livreur', 'Kofi Mensah'),
                ],
              ),
            ),

            // Total à payer (ajouté ici pour être visible sur l'écran de confirmation)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Align(
                // Wrap with Align to control alignment if needed
                alignment: Alignment.centerRight, // Adjust alignment as needed
                child: Text(
                  'Total: 1,500 FCFA',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF008751),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Infos destinataire
            _buildInfoCard(
              title: 'Reçu par:',
              icon: Icons.person,
              iconColor: const Color(0xFF008751),
              content: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF008751),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Marie Adjovi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF1F2937),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Signature électronique confirmée',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Boutons d'action
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  // Bouton Évaluer le service
                  OutlinedButton(
                    onPressed: () {
                      // TODO: Implémenter l'action Évaluer
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(color: Color(0xFF008751)),
                      foregroundColor: const Color(0xFF008751),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.star_border),
                        SizedBox(width: 8),
                        Text('Évaluer le service'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Bouton Retour à l'accueil
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).popUntil(
                        (route) => route.isFirst,
                      ); // Navigate back to the first screen (accueil)
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      elevation: 2,
                      backgroundColor: const Color(
                        0xFF008751,
                      ), // Green background
                      foregroundColor: Colors.white, // White text
                      shadowColor: const Color(
                        0xFF008751,
                      ).withOpacity(0.4), // Green shadow
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.home),
                        SizedBox(width: 8),
                        Text('Retour à l\'accueil'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Bouton Télécharger le reçu
                  OutlinedButton(
                    onPressed: () {
                      // TODO: Implémenter l'action Télécharger reçu
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(color: Color(0xFFE5E7EB)),
                      foregroundColor: const Color(0xFF6B7280), // Grey text
                      backgroundColor: const Color(0xFFF8FAFC),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.download),
                        SizedBox(width: 8),
                        Text('Télécharger le reçu'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Helper widget to build info cards
  Widget _buildInfoCard({
    required String title,
    required IconData icon,
    required Color iconColor,
    required Widget content,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 2), // Shadow at the bottom
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 24),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF1F2937), // Dark color
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          content,
        ],
      ),
    );
  }

  // Helper widget to build detail rows in the GridView
  static Widget _buildDetailRow(String label, String value) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6B7280), // Grey color
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF1F2937), // Dark color
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
