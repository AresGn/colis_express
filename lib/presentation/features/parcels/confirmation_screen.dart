import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Fond principal
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header (copié/adapté de TransportHeader)
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ), // Ajusté padding
              child: Row(
                children: [
                  // Icône retour - action pop pour l'instant
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xFF374151),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Suivi colis', // Titre
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '#CE2024-003', // Sous-titre (numéro de commande statique pour l'instant)
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Bandeau de statut (simplifié)
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF3B82F6),
                    Color(0xFF60A5FA),
                  ], // Couleurs du dégradé
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('🚚', style: TextStyle(fontSize: 32)),
                  SizedBox(height: 8),
                  Text(
                    'En transit', // Titre statut
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Votre colis est en route...', // Sous-texte statut
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      // opacity: 0.9, // Opacity handled by color
                    ),
                  ),
                  SizedBox(height: 8),
                  // Badge Arrivée estimée (simplifié)
                  Chip(
                    backgroundColor:
                        Colors.white70, // Fond blanc semi-transparent
                    label: Text(
                      'Arrivée estimée: 17:30', // Estimation statique
                      style: TextStyle(
                        color: Color(
                          0xFF1F2937,
                        ), // Couleur sombre pour le texte
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Timeline des étapes (représentation simplifiée)
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  // Exemple d'une étape de la timeline
                  _buildTimelineStep(
                    icon: Icons.check_circle,
                    iconColor: Colors.green,
                    title: 'Commande confirmée',
                    description: 'Votre commande a été créée...',
                    time: 'Aujourd\'hui 14:30',
                    isLast: false,
                  ),
                  _buildTimelineStep(
                    icon: Icons.check_circle,
                    iconColor: Colors.green,
                    title: 'Collectée par transporteur',
                    description: null,
                    time: 'Aujourd\'hui 15:45',
                    isLast: false,
                  ),
                  _buildTimelineStep(
                    icon: Icons.local_shipping,
                    iconColor: Colors.blue, // Couleur bleue pour en transit
                    title: 'En transit vers destination',
                    description: null,
                    time: 'Aujourd\'hui 16:20 • En cours...',
                    isLast: false,
                    // isAnimating: true, // Placeholder for animation
                  ),
                  _buildTimelineStep(
                    icon: Icons.archive,
                    iconColor: Colors.grey, // Couleur grise pour à venir
                    title: 'Livraison en cours',
                    description: null,
                    time: 'Aujourd\'hui 17:30', // Estimation
                    isLast: true,
                  ),
                ],
              ),
            ),
            // Actions rapides (simplifié)
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.white, // Fond blanc pour la carte d'actions
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Bouton Contacter transporteur
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        /* TODO: Implement contact action */
                      },
                      icon: const Icon(Icons.call, size: 18), // Icône appel
                      label: const Text('Contacter transporteur'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3B82F6), // Bouton bleu
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Bouton Partager le suivi
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        /* TODO: Implement share action */
                      },
                      icon: const Icon(Icons.share, size: 18), // Icône partage
                      label: const Text('Partager le suivi'),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.resolveWith<Color?>((
                              Set<MaterialState> states,
                            ) {
                              if (states.contains(MaterialState.hovered)) {
                                return const Color(
                                  0xFF3B82F6,
                                ); // Texte bleu au survol
                              }
                              return const Color(
                                0xFF374151,
                              ); // Texte sombre par défaut
                            }),
                        side: MaterialStateProperty.resolveWith<BorderSide?>((
                          Set<MaterialState> states,
                        ) {
                          if (states.contains(MaterialState.hovered)) {
                            return const BorderSide(
                              color: Color(0xFF3B82F6),
                            ); // Bord bleu au survol
                          }
                          return const BorderSide(
                            color: Color(0xFFE5E7EB),
                          ); // Bord gris par défaut
                        }),
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered)) {
                              return const Color(
                                0xFF3B82F6,
                              ).withOpacity(0.04); // Hover effect
                            }
                            return null; // Defer to the widget's default.
                          },
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 12),
                        ),
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Footer
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              child: const Text(
                'Mise à jour automatique • MVP v1.0', // Footer text
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF9CA3AF), // Couleur grise
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineStep({
    required IconData icon,
    required Color iconColor,
    required String title,
    String? description,
    required String time,
    required bool isLast,
    // bool isAnimating = false, // Placeholder for animation parameter
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icône et trait
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: iconColor,
                shape: BoxShape.circle,
                // boxShadow: isAnimating ? [BoxShadow(color: iconColor.withOpacity(0.5), blurRadius: 8, spreadRadius: 4)] : null, // Placeholder for animation effect
              ),
              child: Icon(icon, color: Colors.white, size: 16),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 60, // Longueur du trait
                color: const Color(0xFFE5E7EB), // Couleur du trait gris
              ),
          ],
        ),
        const SizedBox(width: 16),
        // Contenu de l'étape
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF1F2937),
                ),
              ),
              if (description != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        iconColor == Colors.green
                            ? Colors.green
                            : const Color(
                              0xFF6B7280,
                            ), // Couleur verte pour l'heure des étapes terminées, gris sinon
                    fontWeight:
                        iconColor == Colors.green
                            ? FontWeight.bold
                            : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
