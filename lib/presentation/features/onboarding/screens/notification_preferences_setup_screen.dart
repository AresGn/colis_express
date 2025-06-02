import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/theme/app_typography.dart';
import 'package:agbantche/presentation/core/widgets/custom_button.dart';
import 'package:agbantche/presentation/core/navigation/route_names.dart';
import 'package:agbantche/presentation/features/onboarding/widgets/setup_progress_indicator.dart';
import 'package:agbantche/domain/models/notification_preferences.dart';

/// Écran de configuration des préférences de notification
class NotificationPreferencesSetupScreen extends StatefulWidget {
  const NotificationPreferencesSetupScreen({super.key});

  @override
  State<NotificationPreferencesSetupScreen> createState() => _NotificationPreferencesSetupScreenState();
}

class _NotificationPreferencesSetupScreenState extends State<NotificationPreferencesSetupScreen> {
  NotificationPreferences _preferences = NotificationPreferences.defaultPreferences;
  bool _enableSounds = true;
  bool _enableVibration = true;
  bool _enableQuietHours = false;
  TimeOfDay _quietHoursStart = const TimeOfDay(hour: 22, minute: 0);
  TimeOfDay _quietHoursEnd = const TimeOfDay(hour: 7, minute: 0);

  @override
  void initState() {
    super.initState();
    _enableSounds = _preferences.enableSounds;
    _enableVibration = _preferences.enableVibration;
    _enableQuietHours = _preferences.enableQuietHours;
  }

  void _toggleNotification(NotificationType type, NotificationChannel channel, bool enabled) {
    setState(() {
      _preferences = _preferences.toggleNotification(type, channel, enabled);
    });
  }

  void _continueToNextStep() {
    // TODO: Sauvegarder les préférences
    Navigator.pushNamed(context, RouteNames.setupCompletion);
  }

  void _goBack() {
    Navigator.pop(context);
  }

  Future<void> _selectQuietHoursStart() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _quietHoursStart,
    );
    if (picked != null) {
      setState(() {
        _quietHoursStart = picked;
      });
    }
  }

  Future<void> _selectQuietHoursEnd() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _quietHoursEnd,
    );
    if (picked != null) {
      setState(() {
        _quietHoursEnd = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: _goBack,
        ),
        title: Text(
          'Notifications',
          style: AppTypography.h3.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Indicateur de progression
              const SetupProgressIndicator(
                currentStep: 5,
                totalSteps: 6,
                stepTitle: 'Restez informé',
              ),
              
              const SizedBox(height: 24),
              
              // Contenu principal
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Description
                      Text(
                        'Choisissez comment vous souhaitez être notifié du suivi de vos colis.',
                        style: AppTypography.body1.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Types de notifications
                      _buildNotificationTypesSection(),
                      
                      const SizedBox(height: 32),
                      
                      // Paramètres généraux
                      _buildGeneralSettingsSection(),
                      
                      const SizedBox(height: 32),
                      
                      // Heures de silence
                      _buildQuietHoursSection(),
                    ],
                  ),
                ),
              ),
              
              // Boutons d'action
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationTypesSection() {
    final importantTypes = [
      NotificationType.orderConfirmation,
      NotificationType.pickupReady,
      NotificationType.inTransit,
      NotificationType.nearDelivery,
      NotificationType.delivered,
      NotificationType.paymentConfirmation,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Types de notifications',
          style: AppTypography.h4.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        
        const SizedBox(height: 16),
        
        ...importantTypes.map((type) => _buildNotificationTypeCard(type)),
        
        const SizedBox(height: 16),
        
        // Notifications optionnelles
        Text(
          'Notifications optionnelles',
          style: AppTypography.body1.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        
        const SizedBox(height: 12),
        
        _buildNotificationTypeCard(NotificationType.promotions),
        _buildNotificationTypeCard(NotificationType.systemUpdates),
      ],
    );
  }

  Widget _buildNotificationTypeCard(NotificationType type) {
    final title = _preferences.getNotificationTypeDisplayName(type);
    final isPushEnabled = _preferences.isNotificationEnabled(type, NotificationChannel.push);
    final isSmsEnabled = _preferences.isNotificationEnabled(type, NotificationChannel.sms);
    final isEmailEnabled = _preferences.isNotificationEnabled(type, NotificationChannel.email);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTypography.body1.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Canaux de notification
          Row(
            children: [
              Expanded(
                child: _buildChannelToggle(
                  'Push',
                  Icons.notifications_outlined,
                  isPushEnabled,
                  (enabled) => _toggleNotification(type, NotificationChannel.push, enabled),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildChannelToggle(
                  'SMS',
                  Icons.sms_outlined,
                  isSmsEnabled,
                  (enabled) => _toggleNotification(type, NotificationChannel.sms, enabled),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildChannelToggle(
                  'Email',
                  Icons.email_outlined,
                  isEmailEnabled,
                  (enabled) => _toggleNotification(type, NotificationChannel.email, enabled),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChannelToggle(
    String label,
    IconData icon,
    bool isEnabled,
    Function(bool) onToggle,
  ) {
    return InkWell(
      onTap: () => onToggle(!isEnabled),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: isEnabled 
              ? AppColors.primaryGreen.withValues(alpha: 0.1)
              : AppColors.background,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isEnabled ? AppColors.primaryGreen : AppColors.borderLight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 16,
              color: isEnabled ? AppColors.primaryGreen : AppColors.textSecondary,
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: AppTypography.caption.copyWith(
                color: isEnabled ? AppColors.primaryGreen : AppColors.textSecondary,
                fontWeight: isEnabled ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGeneralSettingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Paramètres généraux',
          style: AppTypography.h4.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Sons
        SwitchListTile(
          value: _enableSounds,
          onChanged: (value) {
            setState(() {
              _enableSounds = value;
            });
          },
          title: Text(
            'Sons de notification',
            style: AppTypography.body1.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          subtitle: Text(
            'Jouer un son lors des notifications',
            style: AppTypography.body2.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          activeColor: AppColors.primaryGreen,
          contentPadding: EdgeInsets.zero,
        ),
        
        // Vibrations
        SwitchListTile(
          value: _enableVibration,
          onChanged: (value) {
            setState(() {
              _enableVibration = value;
            });
          },
          title: Text(
            'Vibrations',
            style: AppTypography.body1.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          subtitle: Text(
            'Vibrer lors des notifications',
            style: AppTypography.body2.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          activeColor: AppColors.primaryGreen,
          contentPadding: EdgeInsets.zero,
        ),
      ],
    );
  }

  Widget _buildQuietHoursSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Heures de silence',
          style: AppTypography.h4.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Activer les heures de silence
        SwitchListTile(
          value: _enableQuietHours,
          onChanged: (value) {
            setState(() {
              _enableQuietHours = value;
            });
          },
          title: Text(
            'Activer les heures de silence',
            style: AppTypography.body1.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          subtitle: Text(
            'Désactiver les notifications pendant certaines heures',
            style: AppTypography.body2.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          activeColor: AppColors.primaryGreen,
          contentPadding: EdgeInsets.zero,
        ),
        
        if (_enableQuietHours) ...[
          const SizedBox(height: 16),
          
          // Sélection des heures
          Row(
            children: [
              Expanded(
                child: _buildTimeSelector(
                  'Début',
                  _quietHoursStart,
                  _selectQuietHoursStart,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildTimeSelector(
                  'Fin',
                  _quietHoursEnd,
                  _selectQuietHoursEnd,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildTimeSelector(String label, TimeOfDay time, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderLight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTypography.caption.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              time.format(context),
              style: AppTypography.body1.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        CustomButton(
          text: 'Continuer',
          onPressed: _continueToNextStep,
          variant: ButtonVariant.primary,
          size: ButtonSize.large,
          isFullWidth: true,
        ),
        
        const SizedBox(height: 12),
        
        TextButton(
          onPressed: _continueToNextStep,
          child: Text(
            'Passer cette étape',
            style: AppTypography.body2.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
