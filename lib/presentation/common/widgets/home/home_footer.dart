import 'package:flutter/material.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE5E7EB))),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: const Center(
        child: Text(
          'MVP v1.0 • Colis Express Bénin',
          style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12),
        ),
      ),
    );
  }
}
