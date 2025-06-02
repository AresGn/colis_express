import 'package:agbantche/presentation/features/auth/widgets/user_type_selector.dart';
import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/theme/app_typography.dart';
import 'package:agbantche/presentation/core/navigation/route_names.dart';

import 'package:agbantche/presentation/features/parcels/screens/new_parcel_screen.dart';

/// Écran d'accueil principal de l'application
class HomeScreen extends StatefulWidget {
  final UserType? userType;

  const HomeScreen({super.key, this.userType});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Liste des parcels récents (statique pour l'exemple)
  final List<ParcelPreview> _recentParcels = [
    ParcelPreview(
      id: 'CE2024-001',
      status: 'Livré',
      statusColor: AppColors.success,
      date: '22 Mai 2024',
      description: 'Documents importants',
      recipient: 'Marie Koumako',
    ),
    ParcelPreview(
      id: 'CE2024-002',
      status: 'En transit',
      statusColor: AppColors.primaryBlue,
      date: '24 Mai 2024',
      description: 'Matériel informatique',
      recipient: 'Jean Adjo',
    ),
    ParcelPreview(
      id: 'CE2024-003',
      status: 'En attente',
      statusColor: AppColors.warning,
      date: '27 Mai 2024',
      description: 'Vêtements et accessoires',
      recipient: 'Kofi Mensah',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: _buildBody(),
      drawer: _buildDrawer(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Agbantché'),
      centerTitle: true,
      backgroundColor: AppColors.white,
      elevation: 1,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {
            // TODO: Implémenter la navigation vers les notifications
          },
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header avec salutation et actions rapides
            _buildHeader(),

            // Colis récents
            _buildRecentParcels(),

            // Section d'actions secondaires
            _buildSecondaryActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Salutation
          Text('Bonjour, Jean 👋', style: AppTypography.h2),
          const SizedBox(height: 4),
          Text(
            'Expédier un colis aujourd\'hui',
            style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 24),

          // Bouton principal
          _buildNewParcelButton(),
        ],
      ),
    );
  }

  Widget _buildNewParcelButton() {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 100),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: AppColors.primaryGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGreen.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        const NewParcelScreen(userType: UserType.customer),
              ),
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // Icône et texte
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          'Trouvez un conducteur disponible en quelques clics',
                          style: AppTypography.h3.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Flexible(
                        child: Text(
                          'Créer une nouvelle expédition',
                          style: AppTypography.body2.copyWith(
                            color: Colors.white.withOpacity(0.9),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),

                // Icône flèche
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecentParcels() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre de section avec bouton voir tout
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Colis récents', style: AppTypography.h3),
              TextButton(
                onPressed: () {
                  // TODO: Implémenter la navigation vers la liste complète
                },
                child: Text(
                  'Voir tout',
                  style: AppTypography.body2.copyWith(
                    color: AppColors.primaryGreen,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Liste des colis récents
          _recentParcels.isEmpty
              ? _buildEmptyState()
              : ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _recentParcels.length,
                separatorBuilder:
                    (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return _buildParcelCard(_recentParcels[index]);
                },
              ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      alignment: Alignment.center,
      child: Column(
        children: [
          Icon(Icons.inbox_outlined, size: 48, color: AppColors.textTertiary),
          const SizedBox(height: 16),
          Text(
            'Aucun colis récent',
            style: AppTypography.body1.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Vos colis récents apparaîtront ici',
            style: AppTypography.body2.copyWith(color: AppColors.textTertiary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildParcelCard(ParcelPreview parcel) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // TODO: Implémenter la navigation vers les détails du colis
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Icône de colis
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.inventory_2_outlined,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Informations du colis
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            parcel.id,
                            style: AppTypography.body2.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: parcel.statusColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              parcel.status,
                              style: AppTypography.caption.copyWith(
                                color: parcel.statusColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        parcel.description,
                        style: AppTypography.body2,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 14,
                            color: AppColors.textTertiary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            parcel.recipient,
                            style: AppTypography.caption.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 14,
                            color: AppColors.textTertiary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            parcel.date,
                            style: AppTypography.caption.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryActions() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Services', style: AppTypography.h3),
          const SizedBox(height: 16),

          // Grille d'actions
          Row(
            children: [
              _buildActionItem(
                icon: Icons.search,
                label: 'Suivi colis',
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.tracking);
                },
              ),
              const SizedBox(width: 16),
              _buildActionItem(
                icon: Icons.payment_outlined,
                label: 'Paiements',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteNames.payment,
                    arguments: {
                      'amount': 0.0,
                      'orderId': '',
                      'userType': widget.userType ?? UserType.customer,
                    },
                  );
                },
              ),
              const SizedBox(width: 16),
              _buildActionItem(
                icon: Icons.support_agent_outlined,
                label: 'Support',
                onTap: () {
                  // TODO: Implémenter la navigation vers le support
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Icon(icon, color: AppColors.primaryGreen, size: 28),
                  const SizedBox(height: 8),
                  Text(
                    label,
                    style: AppTypography.caption.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColors.primaryGreen),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Text(
                    'JD',
                    style: TextStyle(
                      color: AppColors.primaryGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Jean Dupont',
                  style: AppTypography.h3.copyWith(color: Colors.white),
                ),
                Text(
                  'jean.dupont@example.com',
                  style: AppTypography.body2.copyWith(color: Colors.white70),
                ),
              ],
            ),
          ),
          // Options du drawer qui ne sont pas dans la barre de navigation
          const Divider(),
          _buildDrawerItem(
            icon: Icons.contacts,
            title: 'Mes contacts',
            onTap: () {
              Navigator.pushNamed(context, RouteNames.contacts);
            },
          ),
          _buildDrawerItem(
            icon: Icons.notifications,
            title: 'Notifications',
            onTap: () {
              // TODO: Naviguer vers l'écran des notifications
            },
          ),
          _buildDrawerItem(
            icon: Icons.settings,
            title: 'Paramètres',
            onTap: () {
              Navigator.pushNamed(context, RouteNames.settings);
            },
          ),
          _buildDrawerItem(
            icon: Icons.help,
            title: 'Aide',
            onTap: () {
              Navigator.pushNamed(context, RouteNames.help);
            },
          ),
          _buildDrawerItem(
            icon: Icons.logout,
            title: 'Déconnexion',
            onTap: () {
              // TODO: Implémenter la déconnexion
            },
          ),
        ],
      ),
    );
  }

  // Helper method to build drawer items
  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryGreen),
      title: Text(title, style: AppTypography.body1),
      onTap: onTap,
    );
  }
}

/// Modèle de données pour les aperçus de colis
class ParcelPreview {
  final String id;
  final String status;
  final Color statusColor;
  final String date;
  final String description;
  final String recipient;

  ParcelPreview({
    required this.id,
    required this.status,
    required this.statusColor,
    required this.date,
    required this.description,
    required this.recipient,
  });
}
