import 'package:benin_express/domain/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:benin_express/domain/models/parcel.dart';
import 'package:benin_express/presentation/core/theme/app_colors.dart';
import 'package:benin_express/presentation/core/theme/app_typography.dart';

/// Widget qui affiche les informations de l'expé9diteur et du destinataire
class ContactsSection extends StatelessWidget {
  final Parcel parcel;

  const ContactsSection({super.key, required this.parcel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Expé9diteur et Destinataire',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            _buildContactInfo(
              context,
              'Expé9diteur',
              parcel.sender,
              Icons.person_outline,
            ),
            const Divider(height: 24),
            _buildContactInfo(
              context,
              'Destinataire',
              parcel.recipient,
              Icons.person,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(
    BuildContext context,
    String title,
    Contact contact,
    IconData icon,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Theme.of(context).primaryColor),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.caption.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 4),
              Text(contact.name, style: AppTypography.body1),
              const SizedBox(height: 2),
              Text(contact.phoneNumber, style: AppTypography.body2),
              if (contact.email?.isNotEmpty ?? false) ...[
                const SizedBox(height: 2),
                Text(contact.email ?? '', style: AppTypography.body2),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
