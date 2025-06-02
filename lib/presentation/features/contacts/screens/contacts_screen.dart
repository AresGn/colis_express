import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/theme/app_typography.dart';
import 'package:agbantche/presentation/core/widgets/custom_button.dart';
import 'package:agbantche/domain/models/saved_contact.dart';
import 'package:agbantche/presentation/features/contacts/widgets/contact_card.dart';
import 'package:agbantche/presentation/features/contacts/widgets/contact_form.dart';

/// Écran de gestion des contacts
class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  // Liste des contacts sauvegardés (statique pour l'instant)
  List<SavedContact> _contacts = [
    SavedContact(
      id: '1',
      name: 'Marie Kone',
      phoneNumber: '96654321',
      address: 'Quartier Banikoara, Parakou',
      label: 'Famille',
      isDefault: true,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
    ),
    SavedContact(
      id: '2',
      name: 'Paul Adjovi',
      phoneNumber: '97887766',
      address: 'Quartier Tokpa, Cotonou',
      label: 'Travail',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
    SavedContact(
      id: '3',
      name: 'Fatou Diallo',
      phoneNumber: '96112233',
      address: 'Quartier Natitingou Centre',
      label: 'Ami',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  void _addContact() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (context) => ContactForm(
            onSave: (contact) {
              setState(() {
                _contacts.add(contact);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Contact ajouté avec succès'),
                  backgroundColor: AppColors.success,
                ),
              );
            },
          ),
    );
  }

  void _editContact(SavedContact contact) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (context) => ContactForm(
            contact: contact,
            onSave: (updatedContact) {
              setState(() {
                final index = _contacts.indexWhere((c) => c.id == contact.id);
                if (index != -1) {
                  _contacts[index] = updatedContact;
                }
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Contact modifié avec succès'),
                  backgroundColor: AppColors.success,
                ),
              );
            },
          ),
    );
  }

  void _deleteContact(SavedContact contact) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Supprimer le contact'),
            content: Text(
              'Êtes-vous sûr de vouloir supprimer ${contact.name} ?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Annuler'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _contacts.removeWhere((c) => c.id == contact.id);
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Contact supprimé'),
                      backgroundColor: AppColors.error,
                    ),
                  );
                },
                child: const Text(
                  'Supprimer',
                  style: TextStyle(color: AppColors.error),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Mes contacts',
          style: AppTypography.h3.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primaryGreen,
        elevation: 0.5,
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: _addContact),
        ],
      ),
      body: _contacts.isEmpty ? _buildEmptyState() : _buildContactsList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addContact,
        backgroundColor: AppColors.primaryGreen,
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.contacts, size: 80, color: AppColors.textTertiary),
            const SizedBox(height: 16),
            Text(
              'Aucun contact',
              style: AppTypography.h3.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 8),
            Text(
              'Ajoutez vos contacts fréquents pour faciliter la création de colis',
              style: AppTypography.body2.copyWith(
                color: AppColors.textTertiary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Ajouter un contact',
              onPressed: _addContact,
              variant: ButtonVariant.primary,
              size: ButtonSize.medium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactsList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _contacts.length,
      itemBuilder: (context, index) {
        final contact = _contacts[index];
        return ContactCard(
          contact: contact,
          onEdit: () => _editContact(contact),
          onDelete: () => _deleteContact(contact),
        );
      },
    );
  }
}
