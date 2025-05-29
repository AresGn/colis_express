import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_colors.dart';
import 'package:benin_express/presentation/core/widgets/custom_input_field.dart';

/// Formulaire d'inscription avec champs pour nom, tu00e9lu00e9phone, email et mot de passe
class RegistrationForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool obscurePassword;
  final bool obscureConfirmPassword;
  final VoidCallback togglePasswordVisibility;
  final VoidCallback toggleConfirmPasswordVisibility;

  const RegistrationForm({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.obscurePassword,
    required this.obscureConfirmPassword,
    required this.togglePasswordVisibility,
    required this.toggleConfirmPasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Nom complet
        CustomInputField(
          controller: nameController,
          label: 'Nom complet',
          prefixIcon: const Icon(Icons.person_outline, color: AppColors.textSecondary),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Veuillez saisir votre nom';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),

        // Numu00e9ro de tu00e9lu00e9phone
        CustomInputField(
          controller: phoneController,
          label: 'Numu00e9ro de tu00e9lu00e9phone',
          prefixIcon: const Icon(Icons.phone_outlined, color: AppColors.textSecondary),
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Veuillez saisir votre numu00e9ro de tu00e9lu00e9phone';
            }
            if (value.length < 8) {
              return 'Numu00e9ro de tu00e9lu00e9phone invalide';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),

        // Email
        CustomInputField(
          controller: emailController,
          label: 'Email',
          prefixIcon: const Icon(Icons.email_outlined, color: AppColors.textSecondary),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Veuillez saisir votre email';
            }
            if (!value.contains('@') || !value.contains('.')) {
              return 'Veuillez saisir un email valide';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),

        // Mot de passe
        CustomInputField(
          controller: passwordController,
          label: 'Mot de passe',
          obscureText: obscurePassword,
          prefixIcon: const Icon(Icons.lock_outline, color: AppColors.textSecondary),
          suffixIcon: IconButton(
            icon: Icon(
              obscurePassword ? Icons.visibility : Icons.visibility_off,
              color: AppColors.textSecondary,
            ),
            onPressed: togglePasswordVisibility,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Veuillez saisir un mot de passe';
            }
            if (value.length < 6) {
              return 'Le mot de passe doit contenir au moins 6 caractu00e8res';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),

        // Confirmation de mot de passe
        CustomInputField(
          controller: confirmPasswordController,
          label: 'Confirmer le mot de passe',
          obscureText: obscureConfirmPassword,
          prefixIcon: const Icon(Icons.lock_outline, color: AppColors.textSecondary),
          suffixIcon: IconButton(
            icon: Icon(
              obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
              color: AppColors.textSecondary,
            ),
            onPressed: toggleConfirmPasswordVisibility,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Veuillez confirmer votre mot de passe';
            }
            if (value != passwordController.text) {
              return 'Les mots de passe ne correspondent pas';
            }
            return null;
          },
        ),
      ],
    );
  }
}
