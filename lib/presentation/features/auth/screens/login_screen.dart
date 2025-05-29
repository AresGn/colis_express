import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_colors.dart';
import 'package:benin_express/presentation/core/widgets/custom_button.dart';
import 'package:benin_express/presentation/core/widgets/custom_input_field.dart';
import 'package:benin_express/presentation/features/home/home_screen.dart';
import 'package:benin_express/presentation/features/auth/widgets/user_type_selector.dart';
import 'package:benin_express/presentation/features/auth/widgets/phone_input_field.dart';
import 'package:benin_express/presentation/features/auth/widgets/forgot_password_link.dart';
import 'package:benin_express/presentation/features/auth/widgets/register_link.dart';

/// u00c9cran de connexion permettant aux utilisateurs de se connecter u00e0 leur compte
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

          // Navigation vers l'u00e9cran principal avec le type d'utilisateur
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomeScreen(userType: _selectedUserType),
            ),
          );
        }
      });
    }
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre numu00e9ro de tu00e9lu00e9phone';
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
                  
                  // Su00e9lecteur de type d'utilisateur
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

                  // Champ de numu00e9ro de tu00e9lu00e9phone
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
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.textSecondary,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Lien mot de passe oubliu00e9
                  ForgotPasswordLink(
                    onPressed: () {
                      // Navigation vers l'u00e9cran de ru00e9cupu00e9ration de mot de passe
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Fonctionnalitu00e9 u00e0 venir'),
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
                      // Navigation vers l'u00e9cran d'inscription
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
