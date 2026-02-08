import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Order Summary", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(height: 30),
          _row("SUBTOTAL", "\$2,790"),
          _row("ESTIMATED SHIPPING", "Free"),
          _row("TAXES", "\$223.20"),
          const Divider(height: 30),
          _row("ESTIMATED TOTAL", "\$3,013.20", isBold: true),
        ],
      ),
    );
  }

  Widget _row(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: isBold ? Colors.black : Colors.grey, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}