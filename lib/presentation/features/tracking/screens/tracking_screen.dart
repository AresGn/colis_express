import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/theme/app_typography.dart';
import 'package:agbantche/presentation/core/widgets/custom_button.dart';
import 'package:agbantche/presentation/core/widgets/custom_input_field.dart';
import 'package:agbantche/presentation/features/tracking/screens/tracking_details_screen.dart';

/// Écran de suivi des colis - recherche par numéro de suivi
class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _trackingNumberController = TextEditingController();
  bool _isLoading = false;

  // Liste d'historique de recherche (statique pour l'exemple)
  final List<String> _recentSearches = ['CE2024-003', 'CE2024-001'];

  @override
  void dispose() {
    _trackingNumberController.dispose();
    super.dispose();
  }

  Future<void> _searchParcel() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simuler une recherche
      await Future.delayed(const Duration(seconds: 1));

      if (mounted) {
        setState(() {
          _isLoading = false;

          // Ajouter à l'historique si pas déjà présent
          if (!_recentSearches.contains(_trackingNumberController.text)) {
            _recentSearches.insert(0, _trackingNumberController.text);
            // Limiter à 5 recherches récentes
            if (_recentSearches.length > 5) {
              _recentSearches.removeLast();
            }
          }
        });

        // Navigation vers les détails du colis
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => TrackingDetailsScreen(
                  trackingNumber: _trackingNumberController.text,
                ),
          ),
        );
      }
    }
  }

  void _useRecentSearch(String trackingNumber) {
    setState(() {
      _trackingNumberController.text = trackingNumber;
    });
    _searchParcel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Suivi de colis'),
        backgroundColor: AppColors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Formulaire de recherche
              _buildSearchForm(),
              const SizedBox(height: 32),

              // Recherches récentes
              _buildRecentSearches(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Texte d'instruction
          Text('Entrez votre numéro de suivi', style: AppTypography.h3),
          const SizedBox(height: 8),
          Text(
            'Vous pouvez suivre l\'état actuel de votre colis en entrant le numéro de suivi ci-dessous',
            style: AppTypography.body2.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 24),

          // Champ de saisie du numéro de suivi
          CustomInputField(
            controller: _trackingNumberController,
            label: 'Numéro de suivi',
            hint: 'Ex: CE2024-003',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez saisir un numéro de suivi';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),

          // Bouton de recherche
          CustomButton(
            text: 'Rechercher',
            icon: Icons.search,
            onPressed: _searchParcel,
            isLoading: _isLoading,
            variant: ButtonVariant.primary,
            size: ButtonSize.large,
          ),
        ],
      ),
    );
  }

  Widget _buildRecentSearches() {
    if (_recentSearches.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Titre de la section
        Text('Recherches récentes', style: AppTypography.h4),
        const SizedBox(height: 16),

        // Liste des recherches récentes
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _recentSearches.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.history,
                color: AppColors.textSecondary,
              ),
              title: Text(_recentSearches[index], style: AppTypography.body2),
              onTap: () => _useRecentSearch(_recentSearches[index]),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.textTertiary,
              ),
            );
          },
        ),
      ],
    );
  }
}
