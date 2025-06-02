import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/widgets/custom_button.dart';

/// Pied de page avec bouton de continuation
class ContinueButtonFooter extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isEnabled;
  final bool isLoading;
  final String text;

  const ContinueButtonFooter({
    super.key,
    required this.onPressed,
    this.isEnabled = true,
    this.isLoading = false,
    this.text = 'Continuer',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -1),
            blurRadius: 4,
          ),
        ],
      ),
      child: CustomButton(
        text: text,
        onPressed: isEnabled ? onPressed : () {},
        isLoading: isLoading,
        variant: ButtonVariant.primary,
        size: ButtonSize.large,
        isFullWidth: true,
      ),
    );
  }
}
