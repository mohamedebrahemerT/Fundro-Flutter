import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(title.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16, letterSpacing: 1.2)),
    );
  }
}