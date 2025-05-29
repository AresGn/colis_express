import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_colors.dart';
import 'package:benin_express/presentation/features/tracking/widgets/map_container.dart';
import 'package:benin_express/presentation/features/tracking/widgets/delivery_info_card.dart';

/// Écran affichant la carte de suivi d'un colis
class TrackingMapScreen extends StatefulWidget {
  final String trackingNumber;

  const TrackingMapScreen({super.key, required this.trackingNumber});

  @override
  State<TrackingMapScreen> createState() => _TrackingMapScreenState();
}

class _TrackingMapScreenState extends State<TrackingMapScreen> {
  bool _isLoading = true;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _loadMapData();
  }

  Future<void> _loadMapData() async {
    // Simuler le chargement des données de la carte
    await Future.delayed(const Duration(seconds: 1));

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _isFullScreen
          ? null
          : AppBar(
              title: Text('Suivi de ${widget.trackingNumber}'),
              backgroundColor: AppColors.white,
              actions: [
                IconButton(
                  icon: const Icon(Icons.fullscreen),
                  onPressed: _toggleFullScreen,
                ),
              ],
            ),
      body: SafeArea(
        child: Stack(
          children: [
            // Carte (simulée pour l'exemple)
            MapContainer(
              isLoading: _isLoading,
              isFullScreen: _isFullScreen,
              onFullScreenToggle: _toggleFullScreen,
              onBackPressed: () {
                if (_isFullScreen) {
                  _toggleFullScreen();
                } else {
                  Navigator.pop(context);
                }
              },
            ),
            
            // Informations du livreur et carte d'info en bas
            if (!_isFullScreen)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: DeliveryInfoCard(
                  onCallPressed: () {
                    // TODO: Implémenter l'action d'appel
                  },
                  onChatPressed: () {
                    // TODO: Implémenter l'action de chat
                  },
                  onSharePressed: () {
                    // TODO: Implémenter l'action de partage
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
