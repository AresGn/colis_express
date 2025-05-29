import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_colors.dart';

/// Bouton principal personnalisé avec différentes variantes
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isFullWidth;
  final IconData? icon;
  final ButtonVariant variant;
  final ButtonSize size;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isFullWidth = true,
    this.icon,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.medium,
  });

  @override
  Widget build(BuildContext context) {
    // Définir les styles en fonction de la variante
    final backgroundColor = _getBackgroundColor();
    final textColor = _getTextColor();
    final borderColor = _getBorderColor();

    // Définir les dimensions en fonction de la taille
    final padding = _getPadding();
    final textStyle = _getTextStyle(textColor);

    // Construire le bouton
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: _buildButton(
        backgroundColor: backgroundColor,
        textColor: textColor,
        borderColor: borderColor,
        padding: padding,
        textStyle: textStyle,
      ),
    );
  }

  Widget _buildButton({
    required Color backgroundColor,
    required Color textColor,
    required Color borderColor,
    required EdgeInsetsGeometry padding,
    required TextStyle textStyle,
  }) {
    final buttonContent = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(textColor),
              ),
            ),
          )
        else if (icon != null)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(icon, color: textColor, size: 18),
          ),
        Flexible(
          child: Text(text, style: textStyle, overflow: TextOverflow.ellipsis),
        ),
      ],
    );

    if (variant == ButtonVariant.text) {
      return TextButton(
        onPressed: isLoading ? null : onPressed,
        style: TextButton.styleFrom(
          foregroundColor: textColor,
          padding: padding,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: buttonContent,
      );
    } else if (variant == ButtonVariant.outline) {
      return OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: textColor,
          side: BorderSide(color: borderColor),
          padding: padding,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: buttonContent,
      );
    } else {
      return ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          disabledBackgroundColor: AppColors.buttonDisabled,
          disabledForegroundColor: Colors.white,
          padding: padding,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: buttonContent,
      );
    }
  }

  // Helpers pour déterminer les couleurs et styles
  Color _getBackgroundColor() {
    switch (variant) {
      case ButtonVariant.primary:
        return AppColors.buttonPrimary;
      case ButtonVariant.secondary:
        return AppColors.buttonSecondary;
      case ButtonVariant.outline:
      case ButtonVariant.text:
        return Colors.transparent;
      case ButtonVariant.danger:
        return AppColors.error;
    }
  }

  Color _getTextColor() {
    switch (variant) {
      case ButtonVariant.primary:
      case ButtonVariant.danger:
        return AppColors.white;
      case ButtonVariant.secondary:
        return AppColors.textPrimary;
      case ButtonVariant.outline:
        return AppColors.buttonPrimary;
      case ButtonVariant.text:
        return AppColors.buttonPrimary;
    }
  }

  Color _getBorderColor() {
    switch (variant) {
      case ButtonVariant.outline:
        return AppColors.buttonPrimary;
      default:
        return Colors.transparent;
    }
  }

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case ButtonSize.small:
        return const EdgeInsets.symmetric(vertical: 8, horizontal: 16);
      case ButtonSize.medium:
        return const EdgeInsets.symmetric(vertical: 12, horizontal: 24);
      case ButtonSize.large:
        return const EdgeInsets.symmetric(vertical: 16, horizontal: 32);
    }
  }

  TextStyle _getTextStyle(Color color) {
    switch (size) {
      case ButtonSize.small:
        return const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ).copyWith(color: color);
      case ButtonSize.medium:
      case ButtonSize.large:
        return const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ).copyWith(color: color);
    }
  }
}

/// Variantes de bouton disponibles
enum ButtonVariant { primary, secondary, outline, text, danger }

/// Tailles de bouton disponibles
enum ButtonSize { small, medium, large }
