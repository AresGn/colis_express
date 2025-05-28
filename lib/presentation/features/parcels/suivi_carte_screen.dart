import 'package:flutter/material.dart';
// Import a map library here later, e.g., import 'package:flutter_map/flutter_map.dart';

class SuiviCarteScreen extends StatelessWidget {
  const SuiviCarteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Fond principal
      appBar: AppBar(
        // Header (inspiré de MVP_suivi-carte)
        title: const Text('Suivi en temps réel'), // Titre
        backgroundColor: Colors.transparent, // Fond transparent
        elevation: 0, // Pas d'ombre
        foregroundColor: Colors.white, // Texte blanc
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFCD116),
                Color(0xFFF59E0B),
              ], // Dégradé jaune/orange
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(
            8.0,
          ), // Ajouter un peu de padding autour du bouton
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2), // Fond semi-transparent
              borderRadius: BorderRadius.circular(8), // Bords arrondis
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ), // Flèche blanche
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true, // Extend body behind AppBar for gradient
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Carte Leaflet (Placeholder)
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[300], // Placeholder gris pour la carte
              child: const Center(
                child: Text(
                  'Zone de la carte OpenStreetMap',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ), // Placeholder text
            ),
          ),
          // Informations livraison + contact
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ), // Bords supérieurs arrondis
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Infos livraison (simplifié)
                    Text(
                      'Commande #CMD-789012',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEF3C7), // Fond jaune clair
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFFF59E0B)),
                      ),
                      child: Text(
                        'En cours de livraison',
                        style: TextStyle(
                          color: Color(0xFF92400E),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    // Adresses (simplifié)
                    Row(
                      children: [
                        Icon(Icons.circle, color: Colors.green, size: 16),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text('Départ: 123 Rue du Commerce, Cotonou'),
                        ), // Adresse de départ
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.circle, color: Colors.orange, size: 16),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Destination: 456 Avenue des Cocotiers, Porto-Novo',
                          ),
                        ), // Adresse de destination
                      ],
                    ),
                    SizedBox(height: 12),
                    // Infos transporteur (simplifié)
                    Text(
                      'Transporteur: Thomas K.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text('Véhicule: Moto bleue - BJ-1234-XY'),
                    SizedBox(height: 12),
                    // Contact transporteur (simplifié)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFE5E7EB)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact transporteur',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: () {
                                    /* TODO: Implement call */
                                  },
                                  icon: Icon(
                                    Icons.call,
                                    color: Color(0xFF6B7280),
                                    size: 18,
                                  ), // Icône appel
                                  label: Text(
                                    'Appeler',
                                    style: TextStyle(color: Color(0xFF6B7280)),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: Color(0xFFE5E7EB)),
                                  ), // Bord gris
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: () {
                                    /* TODO: Implement message */
                                  },
                                  icon: Icon(
                                    Icons.message,
                                    color: Color(0xFF6B7280),
                                    size: 18,
                                  ), // Icône message
                                  label: Text(
                                    'Message',
                                    style: TextStyle(color: Color(0xFF6B7280)),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: Color(0xFFE5E7EB)),
                                  ), // Bord gris
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Ajoutez d'autres informations ou widgets ici
                  ],
                ),
              ),
            ),
          ),
          // Barre d'action en bas (Sticky footer)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Color(0xFFE5E7EB))),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                // Return true when this button is pressed and pop the screen
                Navigator.of(context).pop(true);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                elevation: 2,
                backgroundColor: const Color(0xFF10B981), // Bouton vert
                foregroundColor: Colors.white,
                shadowColor: const Color(0xFF10B981).withOpacity(0.2),
              ),
              child: const Text('Marquer Colis collecté'),
            ),
          ),
        ],
      ),
    );
  }

  // You would implement map related widgets and logic here later
  // For example, using flutter_map or google_maps_flutter

  // You might also need to fetch real-time location data and update the map
}
