import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';

class HomeBannersSection extends StatelessWidget {
  final VoidCallback onExitWindowTap;
  final VoidCallback onAccountSetupTap;

  const HomeBannersSection({
    super.key,
    required this.onExitWindowTap,
    required this.onAccountSetupTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFF3FBF8),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFFFB800), width: 1.5),
      ),
      child: Column(
        children: [
          _buildTopBanner(),
          const SizedBox(height: 15),
          _buildBottomBanner(),
        ],
      ),
    );
  }

  Widget _buildTopBanner() {
    return InkWell(
      onTap: onExitWindowTap,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            height: 90,
            width: double.infinity,
            margin: const EdgeInsets.only(right: 120),
            padding: const EdgeInsets.fromLTRB(15, 10, 35, 10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF10704A), Color(0xFF1ED68D)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "نافذة التخارج متوفرة الآن",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Cairo',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    "استفد من نافذة التخارج وفرص البيع والشراء.",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: Color(0xFFFFB800),
                            size: 14,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "متبقي 6 أيام",
                            style: const TextStyle(
                              color: Color(0xFFFFB800),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 95,
            child: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFFFB800), width: 4),
              ),
              child: Center(
                child: Image.asset(
                  Images.homeBanner,
                  width: 45,
                  height: 45,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.home_work_outlined,
                    color: Color(0xFF006D44),
                    size: 35,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBanner() {
    return InkWell(
      onTap: onAccountSetupTap,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 90,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 35),
            padding: const EdgeInsets.fromLTRB(35, 10, 15, 10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF10704A), Color(0xFF1ED68D)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "تتطلب اللوائح التنظيمية المحلية",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Cairo',
                  ),
                ),
                Text(
                  "يجب على المستثمرين إتمام التحقق قبل الاستثمار",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'Cairo',
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "أكمل إعداداتك",
                      style: const TextStyle(
                        color: Color(0xFFFFB800),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward,
                      color: Color(0xFFFFB800),
                      size: 14,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 15,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 75,
                  width: 75,
                  decoration: const BoxDecoration(
                    color: Color(0xffFFEEBB),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  height: 75,
                  width: 75,
                  child: const CircularProgressIndicator(
                    value: 0.25,
                    strokeWidth: 5,
                    backgroundColor: Color(0xFF00A269),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFFF6C83D),
                    ),
                  ),
                ),
                const Text(
                  "1/4",
                  style: TextStyle(
                    color: Color(0xFF006D44),
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    fontFamily: 'Cairo',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
