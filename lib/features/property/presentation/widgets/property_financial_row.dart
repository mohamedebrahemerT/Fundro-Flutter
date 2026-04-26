import 'package:flutter/material.dart';

class PropertyFinancialRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;
  final String? imageIcon;

  const PropertyFinancialRow({
    super.key,
    required this.label,
    required this.value,
    this.icon,
    this.imageIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // border: Border.all(color: const Color(0xFF00A269), width: 1.5),
          ),
          child: const Icon(
            Icons.info_outline,
            color: Color(0xFF00A269),
            size: 25,
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
                color: Color(0xFF1D2126),
                fontFamily: 'Cairo',
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFFACAFB5),
                fontSize: 14,
                fontFamily: 'Cairo',
              ),
            ),
          ],
        ),
        const SizedBox(width: 15),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFE4F8EF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: imageIcon != null
              ? Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(
                    imageIcon!,
                    color: const Color(0xFF00A269),
                  ),
                )
              : Icon(icon, color: const Color(0xFF00A269), size: 24),
        ),
      ],
    );
  }
}
