import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/widgets/custom_button.dart';
import 'package:agbantche/presentation/core/navigation/route_names.dart';
import 'package:agbantche/presentation/core/navigation/route_guards.dart'
    as guards;
import 'package:agbantche/presentation/features/auth/widgets/user_type_selector.dart'
    show UserType;
import 'package:agbantche/presentation/features/auth/widgets/register_header.dart';
import 'package:agbantche/presentation/features/auth/widgets/registration_form.dart';
import 'package:agbantche/presentation/features/auth/widgets/terms_checkbox.dart';
import 'package:agbantche/presentation/features/auth/widgets/login_link.dart';

/// u00c9cran d'inscription permettant aux utilisateurs de cré9er un compte
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _acceptTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  void _toggleTermsAcceptance() {
    setState(() {
      _acceptTerms = !_acceptTerms;
    });
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate() && _acceptTerms) {
      setState(() {
        _isLoading = true;
      });

      // Simuler une inscription
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() {
          _isLoading = false;
        });

        // Marquer l'utilisateur comme authentifié
        guards.RouteGuards.setAuthenticated(true, guards.UserType.customer);

        // Navigation vers l'intégration post-inscription
        Navigator.of(context).pushReplacementNamed(
          RouteNames.setupWelcome,
          arguments: {'userType': UserType.expediteur},
        );
      }
    } else if (!_acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez accepter les conditions d\'utilisation'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // En-téate
                  const RegisterHeader(),
                  const SizedBox(height: 32),

                  // Formulaire d'inscription
                  RegistrationForm(
                    nameController: _nameController,
                    phoneController: _phoneController,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    confirmPasswordController: _confirmPasswordController,
                    obscurePassword: _obscurePassword,
                    obscureConfirmPassword: _obscureConfirmPassword,
                    togglePasswordVisibility: _togglePasswordVisibility,
                    toggleConfirmPasswordVisibility:
                        _toggleConfirmPasswordVisibility,
                  ),
                  const SizedBox(height: 24),

                  // Acceptation des conditions
                  TermsCheckbox(
                    accepted: _acceptTerms,
                    onToggle: _toggleTermsAcceptance,
                  ),
                  const SizedBox(height: 24),

                  // Bouton d'inscription
                  CustomButton(
                    text: 'Cré9er un compte',
                    onPressed: _register,
                    isLoading: _isLoading,
                    variant: ButtonVariant.primary,
                    size: ButtonSize.large,
                  ),
                  const SizedBox(height: 24),

                  // Lien vers la page de connexion
                  LoginLink(onPressed: () => Navigator.pop(context)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
