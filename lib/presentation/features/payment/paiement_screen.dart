import 'package:flutter/material.dart';
import 'package:benin_express/presentation/features/delivery/livraison_confirmee_screen.dart'; // Import the new screen

// Screen for payment on delivery (for recipient)
class PaiementScreen extends StatefulWidget {
  const PaiementScreen({super.key});

  @override
  State<PaiementScreen> createState() => _PaiementScreenState();
}

class _PaiementScreenState extends State<PaiementScreen> {
  // State to manage selected payment method
  String _selectedPaymentMethod = 'cash'; // 'cash' or 'mobile_money'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Fond principal
      appBar: AppBar(
        title: const Text('Paiement à la livraison'), // Titre
        backgroundColor: Colors.transparent, // Fond transparent pour le dégradé
        elevation: 0, // Pas d'ombre
        foregroundColor: Colors.white, // Texte blanc
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFE8112D),
                Color(0xFFF87171),
              ], // Dégradé rouge/rose
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(
            kToolbarHeight,
          ), // Needed for flexibleSpace gradient
          child: Container(), // Empty container
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ), // Flèche blanche
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      extendBodyBehindAppBar: true, // Extend body behind AppBar for gradient
      body: SafeArea(
        // The body should not start under the AppBar gradient
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Spacer for the AppBar height
            SizedBox(
              height: kToolbarHeight + MediaQuery.of(context).padding.top,
            ), // Add height for AppBar and status bar
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  // Header (Simplified from markdown, integrated into AppBar flexibleSpace)
                  // Colis Info Block
                  _buildInfoCard(
                    emoji: '📦',
                    title: 'Colis en cours de livraison',
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Encart vert (simplified)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(
                              0xFFE0F7FA,
                            ), // Light blue background
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xFF00BCD4),
                            ), // Cyan border
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.local_shipping,
                                color: Color(0xFF00BCD4),
                                size: 16,
                              ), // Truck icon
                              SizedBox(width: 4),
                              Text(
                                '#CE2024-003', // Static colis ref
                                style: TextStyle(
                                  color: Color(0xFF00BCD4),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Expéditeur: Jean Dupont (Cotonou)', // Static sender
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: const [
                            Icon(
                              Icons.delivery_dining,
                              color: Color(0xFF10B981),
                              size: 16,
                            ), // Delivery icon
                            SizedBox(width: 4),
                            Text(
                              'Statut: En livraison', // Static status
                              style: TextStyle(
                                color: Color(0xFF10B981),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Divider(),
                        const SizedBox(height: 8),
                        const Text(
                          'Transporteur: Thomas K.', // Static carrier
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Contenu: Vêtements', // Static content
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: const [
                            Icon(
                              Icons.timer,
                              color: Color(0xFF3B82F6),
                              size: 16,
                            ), // Timer icon
                            SizedBox(width: 4),
                            Text(
                              'Arrivée estimée: Dans 15 minutes', // Static ETA
                              style: TextStyle(
                                color: Color(0xFF3B82F6),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Payment Detail Block
                  _buildInfoCard(
                    emoji: '💰',
                    title: 'Détail du paiement',
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildPaymentRow('Frais de livraison', '2500 FCFA'),
                        _buildPaymentRow('Frais de service', '200 FCFA'),
                        const Divider(),
                        _buildPaymentRow(
                          'Total à payer',
                          '2700 FCFA',
                          isTotal: true,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Payment Method Choice Block
                  _buildInfoCard(
                    emoji: '💳',
                    title: 'Choisir le mode de paiement',
                    content: Column(
                      children: [
                        _buildPaymentMethodTile(
                          icon: Icons.phone_android,
                          iconGradient: const LinearGradient(
                            colors: [
                              Color(0xFFF59E0B),
                              Color(0xFFFBBF24),
                            ], // Orange/Yellow
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          title: 'Mobile Money',
                          subtitle: 'MTN Money, Moov Money',
                          value: 'mobile_money',
                        ),
                        const SizedBox(height: 8),
                        _buildPaymentMethodTile(
                          icon: Icons.money,
                          iconGradient: const LinearGradient(
                            colors: [
                              Color(0xFF10B981),
                              Color(0xFF34D399),
                            ], // Green
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          title: 'Espèces',
                          subtitle: 'Paiement en liquide au transporteur',
                          value: 'cash',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Information Important Banner
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF), // Light blue background
                      border: Border.all(
                        color: const Color(0xFF3B82F6),
                      ), // Blue border
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.info_outline,
                          color: Color(0xFF3B82F6),
                          size: 20,
                        ), // Info icon
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Information importante',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color(0xFF1F2937), // Dark color
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Le paiement se fait uniquement à la réception du colis. Le transporteur vous contactera avant la livraison.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF6B7280),
                                ), // Grey color
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Action Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Color(0xFFE5E7EB)),
                ), // Light grey border top
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, -2), // Shadow at the top
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Refuse Button
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _showRefuseDialog();
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: const BorderSide(
                          color: Color(0xFFE5E7EB),
                        ), // Light grey border
                        foregroundColor: const Color(0xFF6B7280), // Grey text
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ).copyWith(
                        side: MaterialStateProperty.resolveWith<BorderSide?>((
                          states,
                        ) {
                          if (states.contains(MaterialState.hovered) ||
                              states.contains(MaterialState.pressed)) {
                            return const BorderSide(
                              color: Color(0xFFEF4444),
                            ); // Red border on hover/press
                          }
                          return const BorderSide(
                            color: Color(0xFFE5E7EB),
                          ); // Default border
                        }),
                        foregroundColor:
                            MaterialStateProperty.resolveWith<Color?>((states) {
                              if (states.contains(MaterialState.hovered) ||
                                  states.contains(MaterialState.pressed)) {
                                return const Color(
                                  0xFFEF4444,
                                ); // Red text on hover/press
                              }
                              return const Color(0xFF6B7280); // Default text
                            }),
                      ),
                      child: const Text('Refuser'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Confirm Payment Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _showConfirmationDialog();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                        elevation: 2,
                        backgroundColor: const Color(
                          0xFF10B981,
                        ), // Green background
                        foregroundColor: Colors.white, // White text
                        shadowColor: const Color(
                          0xFF10B981,
                        ).withOpacity(0.4), // Green shadow
                      ),
                      child: const Text('Confirmer le paiement'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to build info cards
  Widget _buildInfoCard({
    required String emoji,
    required String title,
    required Widget content,
  }) {
    return Container(
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
              Text(emoji, style: const TextStyle(fontSize: 24)), // Emoji icon
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

  // Helper widget to build payment detail rows
  Widget _buildPaymentRow(String label, String amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color:
                  isTotal
                      ? const Color(0xFF1F2937)
                      : const Color(0xFF6B7280), // Dark or grey color
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: isTotal ? 18 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color:
                  isTotal
                      ? const Color(0xFFE8112D)
                      : const Color(0xFF1F2937), // Red or dark color
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget to build payment method tiles
  Widget _buildPaymentMethodTile({
    required IconData icon,
    required Gradient iconGradient,
    required String title,
    required String subtitle,
    required String value,
  }) {
    bool isSelected = _selectedPaymentMethod == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? const Color(0xFFF0FDF4)
                  : Colors.white, // Light green or white
          border: Border.all(
            color:
                isSelected
                    ? const Color(0xFF10B981)
                    : const Color(0xFFE5E7EB), // Green or light grey
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: iconGradient,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xFF1F2937), // Dark color
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6B7280), // Grey color
                    ),
                  ),
                ],
              ),
            ),
            Radio<String>(
              value: value,
              groupValue: _selectedPaymentMethod,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedPaymentMethod = newValue;
                  });
                }
              },
              activeColor: const Color(0xFF10B981), // Green color
            ),
          ],
        ),
      ),
    );
  }

  // Dialog for payment confirmation
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Paiement confirmé !'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Méthode: ${(_selectedPaymentMethod == 'cash' ? 'Espèces' : 'Mobile Money')}',
              ),
              const Text('Montant: 2700 FCFA'), // Static amount
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                // TODO: Navigate to tracking or success screen if needed
                Navigator.push(
                  // Add navigation here
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            const LivraisonConfirmeeScreen(), // Navigate to the new screen
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  // Dialog for refusal confirmation
  void _showRefuseDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Refuser la livraison ?'),
          content: const Text(
            'Êtes-vous sûr de vouloir refuser cette livraison ? Le colis sera retourné à l\'expéditeur.',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
            ),
            TextButton(
              child: const Text('Refuser', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                // TODO: Implement refusal logic (e.g., navigate back, update status)
              },
            ),
          ],
        );
      },
    );
  }
}
