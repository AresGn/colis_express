import 'package:flutter/material.dart';
import 'package:agbantche/presentation/core/theme/app_colors.dart';
import 'package:agbantche/presentation/core/theme/app_typography.dart';

/// Widget d'indicateur de progression pour le processus d'intégration
class SetupProgressIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final String? stepTitle;

  const SetupProgressIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.stepTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Titre de l'étape (optionnel)
        if (stepTitle != null) ...[
          Text(
            stepTitle!,
            style: AppTypography.h3.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
        ],
        
        // Indicateur de progression
        Row(
          children: [
            // Texte de progression
            Text(
              'Étape ${currentStep + 1} sur $totalSteps',
              style: AppTypography.body2.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            
            const Spacer(),
            
            // Pourcentage
            Text(
              '${((currentStep + 1) / totalSteps * 100).round()}%',
              style: AppTypography.body2.copyWith(
                color: AppColors.primaryGreen,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 8),
        
        // Barre de progression
        _buildProgressBar(),
      ],
    );
  }

  Widget _buildProgressBar() {
    final progress = (currentStep + 1) / totalSteps;
    
    return Container(
      height: 6,
      decoration: BoxDecoration(
        color: AppColors.borderLight,
        borderRadius: BorderRadius.circular(3),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryGreen,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }
}

/// Widget d'indicateur de progression avec étapes discrètes
class SetupStepsIndicator extends StatelessWidget {
  final int currentStep;
  final List<String> stepTitles;

  const SetupStepsIndicator({
    super.key,
    required this.currentStep,
    required this.stepTitles,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        stepTitles.length,
        (index) => Expanded(
          child: _buildStepIndicator(
            index: index,
            title: stepTitles[index],
            isActive: index <= currentStep,
            isCurrent: index == currentStep,
            isLast: index == stepTitles.length - 1,
          ),
        ),
      ),
    );
  }

  Widget _buildStepIndicator({
    required int index,
    required String title,
    required bool isActive,
    required bool isCurrent,
    required bool isLast,
  }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              // Cercle de l'étape
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: isActive 
                      ? AppColors.primaryGreen 
                      : AppColors.borderLight,
                  shape: BoxShape.circle,
                  border: isCurrent 
                      ? Border.all(
                          color: AppColors.primaryGreen,
                          width: 2,
                        )
                      : null,
                ),
                child: Center(
                  child: isActive
                      ? const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 16,
                        )
                      : Text(
                          '${index + 1}',
                          style: AppTypography.caption.copyWith(
                            color: isActive 
                                ? Colors.white 
                                : AppColors.textSecondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
              
              const SizedBox(height: 8),
              
              // Titre de l'étape
              Text(
                title,
                style: AppTypography.caption.copyWith(
                  color: isActive 
                      ? AppColors.textPrimary 
                      : AppColors.textSecondary,
                  fontWeight: isCurrent 
                      ? FontWeight.w600 
                      : FontWeight.normal,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        
        // Ligne de connexion (sauf pour le dernier élément)
        if (!isLast)
          Container(
            width: 24,
            height: 2,
            color: isActive 
                ? AppColors.primaryGreen 
                : AppColors.borderLight,
            margin: const EdgeInsets.only(bottom: 40),
          ),
      ],
    );
  }
}
