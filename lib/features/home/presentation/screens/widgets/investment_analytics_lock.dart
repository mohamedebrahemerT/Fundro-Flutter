import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';
import 'package:fundro_app/features/home/presentation/screens/reinvest_profits_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/auto_invest_screen.dart';

class InvestmentAnalyticsLock extends StatelessWidget {
  const InvestmentAnalyticsLock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "تبدأ درجتك من هنا استثمر",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Color(0xFF1ED794),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "لتكشف تحليلات محفظتك",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Color(0xFF1ED794),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              _buildLockIcon(),
            ],
          ),
          const SizedBox(height: 25),
          const Divider(height: 1),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.arrow_back_ios, size: 16, color: Colors.black),
              Row(
                children: [
                  const Text(
                    "عرض الفرص الاستثمارية",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.home_outlined, color: Color(0xFF1ED794)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "عرض الفرص الاستثمارية",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          const SizedBox(height: 15),
           _buildActionCard(
            title: "إعادة إستثمار الأرباح",
            subtitle:
                "استثمر دخل ومكافأتك تلقائياً مع خدمة إعادة استثمار الأرباح",
            icon: Icons.description_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReinvestProfitsScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 15),
           _buildActionCard(
            title: "استمر تلقائياً",
            subtitle:
                "فعل خدمة الاستثمار التلقائي وقم ببناء محفظة استثمارية متنوعة تلقائياً",
            icon: Icons.description_outlined,
            tag: "غير مفعل",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AutoInvestScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLockIcon() {
    return Container(
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(5),
      child: Image.asset(Images.historyLock, height: 82, width: 82),
      // Stack(
      //   children: [
      //     Center(
      //       child: Icon(
      //         Icons.lock_reset,
      //         size: 50,
      //         color: Colors.blueGrey.withOpacity(0.3),
      //       ),
      //     ),
      //     Center(
      //       child: Icon(
      //         Icons.lock_outline,
      //         size: 24,
      //         color: Colors.blueGrey.withOpacity(0.5),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  Widget _buildActionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    String? tag,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.arrow_back_ios, size: 14, color: Colors.black),
              const Spacer(),
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF9C4).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: Colors.orangeAccent, size: 24),
              ),
            ],
          ),
          if (tag != null)
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: Text(tag, style: const TextStyle(fontSize: 9)),
              ),
            ),
        ],
      ),
      ),
    );
  }
}
