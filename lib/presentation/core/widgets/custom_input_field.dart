import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_colors.dart';
import 'package:benin_express/presentation/core/theme/app_typography.dart';

/// Champ de texte personnalisé et réutilisable
/// Version unifiée qui combine CustomInputField et CustomTextField
class CustomInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? labelText; // Alias pour compatibilité
  final String? prefix;
  final String? hint;
  final String? hintText; // Alias pour compatibilité
  final TextInputType keyboardType;
  final int maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final String? initialValue;
  final bool filled;
  final Color? fillColor;

  const CustomInputField({
    super.key,
    this.controller,
    this.label,
    this.labelText,
    this.prefix,
    this.hint,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.maxLength,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.onTap,
    this.onChanged,
    this.contentPadding,
    this.focusNode,
    this.initialValue,
    this.filled = true,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    // Déterminer le label effectif
    final effectiveLabel = label ?? labelText;
    final effectiveHint = hint ?? hintText;

    // Support pour les deux styles d'affichage
    if (effectiveLabel != null && labelText != null) {
      // Style avec label externe (comme CustomTextField)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(effectiveLabel, style: AppTypography.label),
          ),
          _buildTextField(context, effectiveHint),
        ],
      );
    } else {
      // Style avec label intégré (comme CustomInputField original)
      return _buildTextField(context, effectiveHint, effectiveLabel);
    }
  }

  Widget _buildTextField(
    BuildContext context,
    String? hintText, [
    String? labelText,
  ]) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      keyboardType: keyboardType,
      maxLines: maxLines,
      maxLength: maxLength,
      obscureText: obscureText,
      validator: validator,
      enabled: enabled,
      readOnly: readOnly,
      autofocus: autofocus,
      focusNode: focusNode,
      onTap: onTap,
      onChanged: onChanged,
      style: AppTypography.body1,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixText: prefix,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        filled: filled,
        fillColor:
            fillColor ??
            (enabled
                ? AppColors.inputFill
                : AppColors.inputFill.withValues(alpha: 0.5)),
        counterText: maxLength != null ? null : '',
        contentPadding:
            contentPadding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.inputBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.inputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primaryGreen, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
      ),
    );
  }
}
