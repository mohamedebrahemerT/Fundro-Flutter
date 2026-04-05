// ويدجت الحاوية الخضراء للأقسام
import 'package:flutter/material.dart';

class PropertySectionCard extends StatelessWidget {
  final Widget child;
  final String? title;
  final IconData? icon;

  const PropertySectionCard({
    super.key,
    required this.child,
    this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FDFB), // خلفية فاتحة جداً
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFF1ED794).withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (title != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(icon, color: Colors.black87),
              ],
            ),
            const Divider(height: 25),
          ],
          child,
        ],
      ),
    );
  }
}
