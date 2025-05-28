import 'package:flutter/material.dart';
import 'package:benin_express/config/theme/app_colors.dart';
import 'package:benin_express/config/theme/app_typography.dart';
// ignore: unused_import
import 'package:benin_express/presentation/common/widgets/custom_button.dart';
import 'package:benin_express/presentation/features/auth/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay to automatically navigate to login screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Bienvenue sur Colis Express Bénin',
          style: AppTypography.h1.copyWith(
            color: AppColors.primaryGreen,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
