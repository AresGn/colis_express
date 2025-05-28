import 'package:flutter/material.dart';
import 'package:benin_express/config/theme/app_colors.dart';
import 'package:benin_express/config/theme/app_typography.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final bool readOnly;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final bool autofocus;
  final String? initialValue;
  final bool filled;
  final Color? fillColor;

  const CustomTextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.contentPadding,
    this.focusNode,
    this.autofocus = false,
    this.initialValue,
    this.filled = true,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(labelText!, style: AppTypography.label),
          ),
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          readOnly: readOnly,
          onTap: onTap,
          onChanged: onChanged,
          focusNode: focusNode,
          autofocus: autofocus,
          maxLength: maxLength,
          style: AppTypography.body1,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: contentPadding ?? const EdgeInsets.all(16),
            filled: filled,
            fillColor: fillColor ?? AppColors.inputFill,
            counterText: '',
          ),
        ),
      ],
    );
  }
}
