import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_colors.dart';
import 'package:benin_express/presentation/core/theme/app_typography.dart';
import 'package:benin_express/presentation/core/widgets/custom_button.dart';

/// Widget affichant les informations du livreur et les options de contact
class DeliveryInfoCard extends StatelessWidget {
  final VoidCallback onCallPressed;
  final VoidCallback onChatPressed;
  final VoidCallback onSharePressed;

  const DeliveryInfoCard({
    Key? key,
    required this.onCallPressed,
    required this.onChatPressed,
    required this.onSharePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Poignée pour faire glisser
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 16),
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: AppColors.mediumGrey,
              borderRadius: BorderRadius.circular(5),
            ),
          ),

          // Contenu principal
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Info du livreur
                Row(
                  children: [
                    // Avatar du livreur
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryGreen.withOpacity(0.1),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/placeholder_avatar.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Informations du livreur
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kofi Akolly',
                            style: AppTypography.body1.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '4.8',
                                style: AppTypography.body2.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryGreen.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  'Moto',
                                  style: AppTypography.caption.copyWith(
                                    color: AppColors.primaryGreen,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Bouton d'appel
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryGreen.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.call,
                          color: AppColors.primaryGreen,
                        ),
                        onPressed: onCallPressed,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Boutons d'action
                Row(
                  children: [
                    // Bouton Chat
                    Expanded(
                      child: CustomButton(
                        text: 'Chat',
                        icon: Icons.message,
                        onPressed: onChatPressed,
                        variant: ButtonVariant.outline,
                        size: ButtonSize.small,
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Bouton Partager
                    Expanded(
                      child: CustomButton(
                        text: 'Partager',
                        icon: Icons.share,
                        onPressed: onSharePressed,
                        variant: ButtonVariant.outline,
                        size: ButtonSize.small,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
