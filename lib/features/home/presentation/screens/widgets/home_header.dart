import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';

class HomeHeader extends StatelessWidget {
  final VoidCallback? onMenuTap;
  final VoidCallback? onNotificationTap;

  const HomeHeader({super.key, this.onMenuTap, this.onNotificationTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onMenuTap,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1ED68D), Color(0xFF00A269)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.menu, color: Colors.white, size: 24),
          ),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: onNotificationTap,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF1ED794), width: 1.5),
            ),
            child: const Icon(
              Icons.notifications_none,
              color: Color(0xFF1ED794),
              size: 24,
            ),
          ),
        ),
        const Spacer(),
        Image.asset(Images.logo, height: 35),
      ],
    );
  }
}
