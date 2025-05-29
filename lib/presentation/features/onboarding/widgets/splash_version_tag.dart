import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_typography.dart';

class SplashVersionTag extends StatelessWidget {
  final String version;

  const SplashVersionTag({super.key, this.version = 'v1.0.0'});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Center(
        child: Text(
          version,
          style: AppTypography.caption.copyWith(
            color: Colors.white.withOpacity(0.7),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
