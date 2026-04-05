import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';

class EarnWithFundroCard extends StatelessWidget {
  const EarnWithFundroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "اكسب مع فاندرو",
                    style: TextStyle(
                      color: Color(0xFF1ED794),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "كن مالكاً لعقار وابدأ في كسب الدخول الشهري",
                    style: TextStyle(color: Colors.grey, fontSize: 11),
                  ),
                ],
              ),
              const SizedBox(width: 15),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF1ED68D), Color(0xFF10704A)],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  Images.logoRounded,
                  fit: BoxFit.fill,
                  height: 48,
                  width: 48,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          _buildFeatureItem(
            Icons.assignment_turned_in_outlined,
            "استلم وثائق الملكية القانونية",
          ),
          _buildFeatureItem(
            Icons.visibility_outlined,
            "احصل على دفعات ايجارية شهرية",
          ),
          _buildFeatureItem(
            Icons.trending_up,
            "تملك عقار تزداد قيمته مع مرور الوقت",
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF374151),
            ),
          ),
          const SizedBox(width: 15),
          Icon(icon, color: const Color(0xFF1ED794), size: 20),
        ],
      ),
    );
  }
}
