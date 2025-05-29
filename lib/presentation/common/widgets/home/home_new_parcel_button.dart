import 'package:flutter/material.dart';
import 'package:benin_express/presentation/features/parcels/screens/new_parcel_screen.dart';
import 'package:benin_express/presentation/features/auth/widgets/user_type_selector.dart';

class HomeNewParcelButton extends StatelessWidget {
  final UserType userType;

  const HomeNewParcelButton({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          // Pass userType to NewParcelScreen
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NewParcelScreen(userType: userType),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFFCD116), Color(0xFFF59E0B)],
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.12),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              const Text('📦', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Nouveau colis',
                      style: TextStyle(
                        color: Color(0xFF92400E),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Opacity(
                      opacity: 0.8,
                      child: Text(
                        'Créer un envoi',
                        style: TextStyle(
                          color: Color(0xFF92400E),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
