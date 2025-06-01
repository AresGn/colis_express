import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_colors.dart';

/// Types d'utilisateurs disponibles
enum UserType { expediteur, livreur, customer }

/// Widget qui permet de sé9lectionner le type d'utilisateur (expé9diteur ou livreur)
class UserTypeSelector extends StatelessWidget {
  final UserType selectedUserType;
  final Function(UserType) onUserTypeChanged;

  const UserTypeSelector({
    super.key,
    required this.selectedUserType,
    required this.onUserTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(8),
      selectedBorderColor: AppColors.primaryGreen,
      selectedColor: Colors.white,
      fillColor: AppColors.primaryGreen,
      color: AppColors.textSecondary,
      constraints: BoxConstraints.expand(
        width: (MediaQuery.of(context).size.width - 48 - 8) / 2,
        height: 40,
      ),
      onPressed: (int index) {
        if (index == 0) {
          onUserTypeChanged(UserType.expediteur);
        } else {
          onUserTypeChanged(UserType.livreur);
        }
      },
      isSelected: [
        selectedUserType == UserType.expediteur,
        selectedUserType == UserType.livreur,
      ],
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Expé9diteur'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Livreur'),
        ),
      ],
    );
  }
}
