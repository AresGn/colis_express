import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_colors.dart';
import 'package:benin_express/presentation/core/widgets/custom_button.dart';
import 'package:benin_express/presentation/core/widgets/custom_input_field.dart';
import 'package:benin_express/presentation/core/navigation/route_names.dart';
import 'package:benin_express/presentation/core/navigation/route_guards.dart'
    as Guards;
import 'package:benin_express/presentation/features/auth/widgets/user_type_selector.dart';
import 'package:benin_express/presentation/features/auth/widgets/phone_input_field.dart';
import 'package:benin_express/presentation/features/auth/widgets/forgot_password_link.dart';
import 'package:benin_express/presentation/features/auth/widgets/register_link.dart';

/// u00c9cran de connexion permettant aux utilisateurs de se connecter é0 leur compte
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _obscurePassword = true;
  UserType _selectedUserType = UserType.expediteur;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulation de connexion
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });

          // Convertir le type d'utilisateur pour les guards
          Guards.UserType guardUserType;
          switch (_selectedUserType) {
            case UserType.expediteur:
              guardUserType = Guards.UserType.customer;
              break;
            case UserType.livreur:
              guardUserType = Guards.UserType.transporter;
              break;
            default:
              guardUserType = Guards.UserType.customer;
          }

          // Marquer l'utilisateur comme authentifié
          Guards.RouteGuards.setAuthenticated(true, guardUserType);

          // Debug: Afficher un message de succès
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Connexion réussie! Type: $_selectedUserType'),
              backgroundColor: AppColors.success,
              duration: const Duration(seconds: 1),
            ),
          );

          // Navigation vers l'é9cran principal avec le type d'utilisateur
          Navigator.of(context).pushReplacementNamed(
            RouteNames.customerHome,
            arguments: {'userType': _selectedUserType},
          );
        }
      });
    }
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre numé9ro de té9lé9phone';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre mot de passe';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),

                  // Sé9lecteur de type d'utilisateur
                  UserTypeSelector(
                    selectedUserType: _selectedUserType,
                    onUserTypeChanged: (type) {
                      setState(() {
                        _selectedUserType = type;
                      });
                    },
                  ),

                  const SizedBox(height: 40),

                  // Logo ou image de marque
                  Image.asset(
                    'assets/images/logo.png',
                    height: 120,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.local_shipping,
                        size: 80,
                        color: AppColors.primaryGreen,
                      );
                    },
                  ),

                  const SizedBox(height: 32),

                  // Champ de numé9ro de té9lé9phone
                  PhoneInputField(
                    controller: _phoneController,
                    validator: _validatePhone,
                  ),

                  const SizedBox(height: 16),

                  // Champ de mot de passe
                  CustomInputField(
                    controller: _passwordController,
                    label: 'Mot de passe',
                    obscureText: _obscurePassword,
                    validator: _validatePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.textSecondary,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Lien mot de passe oublié9
                  ForgotPasswordLink(
                    onPressed: () {
                      // Navigation vers l'é9cran de ré9cupé9ration de mot de passe
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Fonctionnalité9 é0 venir'),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 24),

                  // Bouton de connexion
                  CustomButton(
                    text: 'Connexion',
                    onPressed: _login,
                    isLoading: _isLoading,
                  ),

                  const SizedBox(height: 24),

                  // Lien vers l'inscription
                  RegisterLink(
                    onPressed: () {
                      // Navigation vers l'é9cran d'inscription
                      Navigator.pushNamed(context, '/register');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
