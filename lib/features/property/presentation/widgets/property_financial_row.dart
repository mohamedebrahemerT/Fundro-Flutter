import 'package:flutter/material.dart';

class PropertyFinancialRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const PropertyFinancialRow({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF1ED794), width: 1.5),
          ),
          child: const Icon(
            Icons.info_outline,
            color: Color(0xFF1ED794),
            size: 20,
          ),
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Color(0xFF333333),
              ),
            ),
            Text(
              label,
              style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 13),
            ),
          ],
        ),
        const SizedBox(width: 15),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFE8F9F3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: const Color(0xFF1ED794), size: 24),
        ),
      ],
    );
  }
}
