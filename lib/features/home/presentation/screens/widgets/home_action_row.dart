import 'package:flutter/material.dart';

class HomeActionRow extends StatelessWidget {
  const HomeActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionItem(Icons.sync, "استثمر"),
        _buildActionItem(Icons.trending_up, "إيداع"),
        _buildActionItem(Icons.auto_awesome, "اكسب"),
        _buildActionItem(Icons.home_work_outlined, "بيع"),
      ],
    );
  }

  Widget _buildActionItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFFFD144),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
