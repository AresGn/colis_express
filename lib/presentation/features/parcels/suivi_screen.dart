import 'package:flutter/material.dart';
import 'package:benin_express/presentation/features/parcels/suivi_carte_screen.dart'; // Import the new map screen

// Convert SuiviScreen to StatefulWidget
class SuiviScreen extends StatefulWidget {
  const SuiviScreen({super.key});

  @override
  State<SuiviScreen> createState() => _SuiviScreenState();
}

class _SuiviScreenState extends State<SuiviScreen> {
  // Add state variable to track if collected
  bool _isCollected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Fond principal
      appBar: AppBar(
        title: const Text('Suivi colis'), // Titre
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1F2937), // Couleur sombre
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF374151)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Bandeau de statut (simplifié)
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF3B82F6),
                      Color(0xFF60A5FA),
                    ], // Dégradé bleu
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
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
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    SizedBox(height: 8),
                    // Badge Arrivée estimée (simplifié)
                    Chip(
                      backgroundColor:
                          Colors.white70, // Fond blanc semi-transparent
                      label: Text(
                        'Arrivée estimée: 17:30', // Estimation statique
                        style: TextStyle(
                          color: Color(0xFF1F2937), // Couleur sombre
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Timeline des étapes (représentation simplifiée)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildTimelineStep(
                      icon: Icons.check_circle,
                      iconColor: Colors.green,
                      title: 'Commande confirmée',
                      description: 'Votre commande a été créée...',
                      time: 'Aujourd\'hui 14:30',
                      isLast: false,
                    ),
                    // Use state to determine icon and color for 'Collectée par transporteur'
                    _buildTimelineStep(
                      icon: _isCollected ? Icons.check_circle : Icons.archive,
                      iconColor: _isCollected ? Colors.green : Colors.grey,
                      title: 'Collectée par transporteur',
                      description: null,
                      time: 'Aujourd\'hui 15:45',
                      isLast: false,
                    ),
                    _buildTimelineStep(
                      icon: Icons.local_shipping,
                      iconColor: Colors.blue, // En transit
                      title: 'En transit vers destination',
                      description: null,
                      time: 'Aujourd\'hui 16:20 • En cours...',
                      isLast: false,
                    ),
                    _buildTimelineStep(
                      icon: Icons.archive,
                      iconColor: Colors.grey, // À venir
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
                color: Colors.white, // Fond blanc
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          /* TODO: Implement contact action */
                        },
                        icon: const Icon(Icons.call, size: 18), // Icône appel
                        label: const Text('Contacter transporteur'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(
                            0xFF3B82F6,
                          ), // Bouton bleu
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () async {
                          // Navigate to SuiviCarteScreen and wait for result
                          final result = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SuiviCarteScreen(),
                            ),
                          );
                          // If result is true, update state
                          if (result == true) {
                            setState(() {
                              _isCollected = true;
                            });
                          }
                        },
                        icon: const Icon(
                          Icons.map, // Changed icon to map
                          size: 18,
                        ), // Icône partage
                        label: const Text(
                          'Voir la position du transporteur',
                        ), // Changed button text
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(
                            0xFF374151,
                          ), // Texte sombre
                          side: const BorderSide(
                            color: Color(0xFFE5E7EB),
                          ), // Bord gris
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ).copyWith(
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color?>((
                                Set<MaterialState> states,
                              ) {
                                if (states.contains(MaterialState.hovered)) {
                                  return const Color(
                                    0xFF3B82F6,
                                  ).withOpacity(0.04); // Hover effect
                                }
                                return null; // Defer to the widget's default.
                              }),
                          side: MaterialStateProperty.resolveWith<BorderSide?>((
                            Set<MaterialState> states,
                          ) {
                            if (states.contains(MaterialState.hovered)) {
                              return const BorderSide(
                                color: Color(0xFF3B82F6),
                              ); // Bord bleu au survol
                            }
                            return null; // Defer to the widget's default.
                          }),
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color?>((
                                Set<MaterialState> states,
                              ) {
                                if (states.contains(MaterialState.hovered)) {
                                  return const Color(
                                    0xFF3B82F6,
                                  ); // Texte bleu au survol
                                }
                                return null; // Defer to the widget's default.
                              }),
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
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: iconColor,
                shape: BoxShape.circle,
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
                            : const Color(0xFF6B7280),
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
