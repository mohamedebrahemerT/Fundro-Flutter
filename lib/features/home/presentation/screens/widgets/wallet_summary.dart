import 'package:flutter/material.dart';

class WalletSummary extends StatelessWidget {
  final String amount;
  const WalletSummary({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        const Text(
          "قيمة محفظتك العقارية",
          style: TextStyle(
            color: Color(0xFF4B5563),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          amount,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
