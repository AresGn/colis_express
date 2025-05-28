import 'package:flutter/material.dart';
import 'package:benin_express/config/theme/app_colors.dart';
import 'package:benin_express/config/theme/app_typography.dart';
import 'package:benin_express/presentation/common/widgets/splash/splash_logo.dart';
import 'package:benin_express/presentation/common/widgets/splash/splash_branding.dart';
import 'package:benin_express/presentation/common/widgets/splash/splash_loading_indicator.dart';
import 'package:benin_express/presentation/common/widgets/splash/splash_version_tag.dart';
import 'package:benin_express/presentation/features/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 8), () {
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
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.primaryYellow, AppColors.primaryGreen],
                stops: [0.0, 1.0],
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SplashLogo(),
                    SizedBox(height: 32),
                    SplashBranding(),
                    SizedBox(height: 32),
                    SplashLoadingIndicator(),
                  ],
                ),
              ),
            ),
          ),
          const SplashVersionTag(),
        ],
      ),
    );
  }
}
