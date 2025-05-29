import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_colors.dart';
import 'package:benin_express/presentation/core/theme/app_typography.dart';
import 'package:benin_express/presentation/core/widgets/custom_input_field.dart';

/// Champ de saisie du numu00e9ro de tu00e9lu00e9phone avec indicatif pays
class PhoneInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;

  const PhoneInputField({
    super.key, 
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Indicatif pays
        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            color: AppColors.inputFill,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.inputBorder),
          ),
          child: Center(
            child: Text(
              '+229',
              style: AppTypography.body1.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        
        // Champ de saisie du numu00e9ro
        Expanded(
          child: CustomInputField(
            controller: controller,
            label: 'Numu00e9ro de tu00e9lu00e9phone',
            keyboardType: TextInputType.phone,
            validator: validator,
          ),
        ),
      ],
    );
  }
}
