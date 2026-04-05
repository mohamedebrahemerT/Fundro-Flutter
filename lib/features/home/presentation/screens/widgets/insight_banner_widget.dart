import 'package:flutter/material.dart';

class InsightBannerWidget extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback? onTap;

  const InsightBannerWidget({
    super.key,
    required this.title,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 220,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF01724D), Color(0xFF02BA78)],
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 14),
            ),
          ],
        ),
      ),
    );
  }
}
