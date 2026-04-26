import 'package:flutter/material.dart';

class PropertyFundingBanner extends StatelessWidget {
  const PropertyFundingBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF1ED794),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "أضف إلي العربة",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Cairo',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 6,
            child: Container(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "5.000",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Cairo'),
                  ),
                  const Text(
                    "د.إ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'Cairo'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
