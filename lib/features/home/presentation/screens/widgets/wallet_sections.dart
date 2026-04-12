import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';
import 'package:fundro_app/features/home/presentation/screens/security_info_screen.dart';

class WalletPaymentCard extends StatelessWidget {
  const WalletPaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Mastercard placeholder if not in Images
              // const Icon(Icons.credit_card, size: 20, color: Colors.orange),
              // const SizedBox(width: 10),
              Image.asset(Images.payMethods, height: 35),

              // const SizedBox(width: 10),
              // const Icon(Icons.apple, size: 20),
              // const SizedBox(width: 5),
              // const Text("Pay", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            "الدفع عن طريق بطاقة الخصم أو التحويل البنكي",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "أضف حسابك البنكي، أو ادفع فوراً باستخدام بطاقة الخصم",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontFamily: 'Cairo',
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFD144),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add_circle_outline, size: 18),
                SizedBox(width: 8),
                Text(
                  "أضف طريقة الدفع",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
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

class TransactionSection extends StatefulWidget {
  const TransactionSection({super.key});

  @override
  State<TransactionSection> createState() => _TransactionSectionState();
}

class _TransactionSectionState extends State<TransactionSection> {
  int selectedFilterIndex = 0;
  final filters = [
    "جميع معاملاتي",
    "الاستثمارات",
    "الإيجار",
    "الوارد",
    "الصادر",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "المعاملات",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          reverse: true, // RTL
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: List.generate(filters.length, (index) {
              final isSelected = selectedFilterIndex == index;
              final Color mainColor = const Color(0xFF00A36C);
              final Color lightColor = const Color(0xFFE1F5ED);

              IconData? filterIcon;
              switch (filters[index]) {
                case "الإيجار":
                  filterIcon = Icons.payments_outlined;
                  break;
                case "الوارد":
                  filterIcon = Icons.north_east;
                  break;
                case "الصادر":
                  filterIcon = Icons.south_west;
                  break;
                case "الاستثمارات":
                  filterIcon = Icons.trending_up;
                  break;
                case "جميع معاملاتي":
                  filterIcon = Icons.list;
                  break;
              }

              return GestureDetector(
                onTap: () => setState(() => selectedFilterIndex = index),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? mainColor : lightColor,
                    border: Border.all(color: mainColor),
                    borderRadius: BorderRadius.circular(
                      10,
                    ), // More rectangular like the image
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (filterIcon != null) ...[
                        Icon(
                          filterIcon,
                          size: 16,
                          color: isSelected ? Colors.white : mainColor,
                        ),
                        const SizedBox(width: 8),
                      ],
                      Text(
                        filters[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : mainColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo',
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 20),
        if (selectedFilterIndex == 3) // "الوارد"
          _buildTransactionItem(
            title: "هدية التسجيل",
            subtitle: "هدية التسجيل",
            amount: "+150 ﷼",
            date: "DES 1.2026",
            icon: Icons.south_west,
            isIncoming: true,
          )
        else
          Center(
            child: Column(
              children: [
                Icon(
                  Icons.receipt_long_outlined,
                  size: 60,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(height: 15),
                const Text(
                  "لا توجد معاملات في هذه المرحلة\nحتى الآن",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontFamily: 'Cairo',
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildTransactionItem({
    required String title,
    required String subtitle,
    required String amount,
    required String date,
    required IconData icon,
    required bool isIncoming,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isIncoming ? const Color(0xFF00A36C) : Colors.red,
                  fontFamily: 'Cairo',
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  fontFamily: 'Cairo',
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontFamily: 'Cairo',
                ),
              ),
            ],
          ),
          const SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFE1F5ED),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF00A36C).withOpacity(0.5),
              ),
            ),
            child: Icon(icon, color: const Color(0xFF00A36C), size: 24),
          ),
        ],
      ),
    );
  }
}

class SecurityTrustCard extends StatelessWidget {
  const SecurityTrustCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "أموالك آمنه معنا",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                ),
              ),
              const SizedBox(width: 10),
              Image.asset(Images.lock, height: 35),
            ],
          ),
          const SizedBox(height: 20),
          _buildTextRow(
            "منظمون من قبل سلطة دبي للخدمات المالية",
            Images.protect,
          ),
          _buildTextRow(
            "يتم تسجيل الاستثمارات في مركز دبي المالي العالمي",
            Images.statistics,
          ),
          _buildTextRow("يتم دفع الإيجار شهرياً في محفظتك", Images.payMoney),
          const Divider(height: 30),
          Row(
            children: [
              const Icon(Icons.arrow_back_ios, size: 14, color: Colors.grey),
              const Spacer(),
              const Text(
                "قراءة عن الأمن لدينا",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                ),
              ),
              const SizedBox(width: 10),
              Image.asset(Images.info),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextRow(String text, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 13, fontFamily: 'Cairo'),
            ),
          ),
          const SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              // color: const Color(0xFFFFD144).withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Image.asset(image),
          ),
        ],
      ),
    );
  }
}

class AcademyCarousel extends StatelessWidget {
  const AcademyCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Featured Card (Static)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF13966F),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "5 دقائق فقط",
                      style: TextStyle(
                        color: Color(0xFFFFD144),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    Text(
                      "أكاديمية فندرو",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45, left: 10, right: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecurityInfoScreen(),
                      ),
                    );
                  },
                  child: _buildFeaturedCard(
                    "الأمن والأمان",
                    "تعلم من محمد الرئيس التنفيذي لدينا",
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        // Bottom Carousel (Green Cards)
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            reverse: true, // RTL
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
              _buildGreenCard(
                "كيف تحمي سلطة دبي\nللخدمات المالية أموالي؟",
                const Color(0xFF006D44),
              ),
              _buildGreenCard("ماذا يحدث عند\nفندرو؟", const Color(0xFF1ED794)),
            ],
          ),
        ),
        const SizedBox(height: 15),
        // Pagination Dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF1ED794).withOpacity(0.2),
              ),
              child: const Center(
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: Color(0xFF1ED794),
                ),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildFeaturedCard(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Cairo',
                  ),
                ),
                Text(
                  subtitle,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontFamily: 'Cairo',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Container(height: 40, width: 1, color: Colors.grey.withOpacity(0.2)),
          const SizedBox(width: 15),
          Image.asset(Images.logoRounded, height: 45),
        ],
      ),
    );
  }

  Widget _buildGreenCard(String title, Color color) {
    return Container(
      width: 250,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: 'Cairo',
              ),
            ),
          ),
          const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
        ],
      ),
    );
  }
}
