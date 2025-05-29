import 'package:flutter/material.dart';
import 'package:benin_express/presentation/core/theme/app_colors.dart';
import 'package:benin_express/presentation/core/widgets/screen_header.dart';
import 'package:benin_express/presentation/features/payment/models/payment_method.dart';
import 'package:benin_express/presentation/features/payment/widgets/amount_summary.dart';
import 'package:benin_express/presentation/features/payment/widgets/card_form.dart';
import 'package:benin_express/presentation/features/payment/widgets/payment_button.dart';
import 'package:benin_express/presentation/features/payment/widgets/payment_methods_list.dart';
import 'package:benin_express/presentation/features/payment/screens/payment_confirmation_screen.dart';
import 'package:benin_express/presentation/features/auth/widgets/user_type_selector.dart'
    show UserType;

/// Écran de paiement pour finaliser une commande
class PaymentScreen extends StatefulWidget {
  final double amount;
  final String orderId;
  final UserType userType;

  const PaymentScreen({
    super.key,
    required this.amount,
    required this.orderId,
    required this.userType,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _cardHolderController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();

  int _selectedPaymentMethod = 0;
  bool _isLoading = false;

  // Liste des méthodes de paiement disponibles
  final List<PaymentMethod> _paymentMethods = [
    PaymentMethod(
      id: 0,
      name: 'Carte de crédit/débit',
      icon: Icons.credit_card,
      requiresForm: true,
    ),
    PaymentMethod(
      id: 1,
      name: 'Mobile Money',
      icon: Icons.phone_android,
      requiresForm: false,
    ),
    PaymentMethod(
      id: 2,
      name: 'Paiement à la livraison',
      icon: Icons.money,
      requiresForm: false,
    ),
  ];

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardHolderController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _selectPaymentMethod(int id) {
    setState(() {
      _selectedPaymentMethod = id;
    });
  }

  Future<void> _processPayment() async {
    final selectedMethod = _paymentMethods[_selectedPaymentMethod];

    // Valider le formulaire si nécessaire
    if (selectedMethod.requiresForm) {
      if (!_formKey.currentState!.validate()) {
        return;
      }
    }

    setState(() {
      _isLoading = true;
    });

    // Simuler le traitement du paiement
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() {
        _isLoading = false;
      });

      // Navigation vers l'écran de confirmation
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentConfirmationScreen(
            amount: widget.amount,
            orderId: widget.orderId,
            paymentMethod: selectedMethod.name,
            userType: widget.userType,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // En-tête
            ScreenHeader(
              title: 'Paiement',
              subtitle: 'Choisissez votre mode de paiement',
              onBackPressed: () => Navigator.of(context).pop(),
            ),

            // Contenu principal
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Résumé du montant
                    AmountSummary(amount: widget.amount),
                    const SizedBox(height: 24),

                    // Méthodes de paiement
                    PaymentMethodsList(
                      paymentMethods: _paymentMethods,
                      selectedPaymentMethodId: _selectedPaymentMethod,
                      onPaymentMethodSelected: _selectPaymentMethod,
                    ),
                    const SizedBox(height: 24),

                    // Formulaire de carte (affiché conditionnellement)
                    if (_paymentMethods[_selectedPaymentMethod].requiresForm)
                      CardForm(
                        formKey: _formKey,
                        cardNumberController: _cardNumberController,
                        cardHolderController: _cardHolderController,
                        expiryDateController: _expiryDateController,
                        cvvController: _cvvController,
                      ),
                  ],
                ),
              ),
            ),

            // Bouton de paiement
            PaymentButton(
              amount: widget.amount,
              onPressed: _processPayment,
              isLoading: _isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
