import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  final VoidCallback? onTap;

  const PromoBanner({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF006D44),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.arrow_back_ios, color: Colors.white, size: 16),
            const Expanded(
              child: Text(
                "نافذة التخارج متوفرة الآن\nاستفد من المساهمين لإتمام عمليات البيع والشراء",
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.home_work, color: Color(0xFF006D44)),
            ),
          ],
        ),
      ),
    );
  }
}
