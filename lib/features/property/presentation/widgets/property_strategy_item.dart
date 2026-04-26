import 'package:flutter/material.dart';

class PropertyStrategyItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? icon;
  final String? imageIcon;

  const PropertyStrategyItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
    this.imageIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Spacer(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF1D2126),
                    fontFamily: 'Cairo',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFFACAFB5),
                    fontSize: 13,
                    height: 1.4,
                    fontFamily: 'Cairo',
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
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
                    child: Image.asset(imageIcon!, color: const Color(0xFF00A269)),
                  )
                : Icon(icon, color: const Color(0xFF00A269), size: 24),
          ),
        ],
      ),
    );
  }
}

