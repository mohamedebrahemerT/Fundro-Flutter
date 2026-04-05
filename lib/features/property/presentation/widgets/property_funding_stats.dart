import 'package:flutter/material.dart';

class PropertyFundingStats extends StatelessWidget {
  const PropertyFundingStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Text(
          "ممولة بنسبة 100%",
          style: TextStyle(
            color: Color(0xFF1ED794),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        const Text(
          "1461 مستثمر • December 1, 2025",
          style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 14),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 25),
        Divider(color: Colors.grey.shade200),
      ],
    );
  }
}
