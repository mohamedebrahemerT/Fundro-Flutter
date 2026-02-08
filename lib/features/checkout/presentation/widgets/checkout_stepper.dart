import 'package:flutter/material.dart';

class CheckoutStepper extends StatelessWidget {
  final int currentStep; // 0 for Cart, 1 for Checkout, 2 for Complete
  const CheckoutStepper({super.key, this.currentStep = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Row(
        children: [
          _buildStep("CART", isCompleted: currentStep >= 0),
          _buildLine(isCompleted: currentStep >= 1),
          _buildStep("CHECKOUT", isCompleted: currentStep >= 1),
          _buildLine(isCompleted: currentStep >= 2),
          _buildStep("COMPLETE", isCompleted: currentStep >= 2),
        ],
      ),
    );
  }

  Widget _buildStep(String label, {required bool isCompleted}) {
    return Column(
      children: [
        Container(
          width: 20, height: 20,
          decoration: BoxDecoration(
            color: isCompleted ? Colors.black : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: isCompleted ? Colors.black : Colors.grey)),
      ],
    );
  }

  Widget _buildLine({required bool isCompleted}) {
    return Expanded(
      child: Container(height: 1, color: isCompleted ? Colors.black : Colors.grey.shade300, margin: const EdgeInsets.only(bottom: 15)),
    );
  }
}