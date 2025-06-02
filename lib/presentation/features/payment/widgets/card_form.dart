import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_typography.dart';
import 'package:agbantche/presentation/core/widgets/custom_input_field.dart';

class CardForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController cardNumberController;
  final TextEditingController cardHolderController;
  final TextEditingController expiryDateController;
  final TextEditingController cvvController;

  const CardForm({
    Key? key,
    required this.formKey,
    required this.cardNumberController,
    required this.cardHolderController,
    required this.expiryDateController,
    required this.cvvController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Détails de la carte', style: AppTypography.h4),
          const SizedBox(height: 16),

          // Numéro de carte
          CustomInputField(
            controller: cardNumberController,
            label: 'Numéro de carte',
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez saisir le numéro de carte';
              }
              if (value.length < 16) {
                return 'Numéro de carte invalide';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Titulaire de la carte
          CustomInputField(
            controller: cardHolderController,
            label: 'Titulaire de la carte',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez saisir le nom du titulaire';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Date d'expiration et CVV
          Row(
            children: [
              // Date d'expiration
              Expanded(
                child: CustomInputField(
                  controller: expiryDateController,
                  label: 'Date d\'expiration',
                  hint: 'MM/AA',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Requis';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 16),

              // CVV
              Expanded(
                child: CustomInputField(
                  controller: cvvController,
                  label: 'CVV',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Requis';
                    }
                    if (value.length < 3) {
                      return 'CVV invalide';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
