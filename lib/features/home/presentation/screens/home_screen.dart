import 'package:flutter/material.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/property_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      bottomNavigationBar: _buildBottomNav(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // بانر التوعية (الأخضر والأصفر)
            _buildPromoBanner(),
            const SizedBox(height: 15),
            // الفلاتر (المتوفرة، الممولة، الخ)
            _buildFilterRow(),
            const SizedBox(height: 20),
            // قائمة العقارات
            const PropertyCard(
              title: "فيلا فاخرة في الرياض",
              price: "2,500,000 ريال",
              location: "الرياض، حي النرجس",
              status: "متاح",
              timeLeft: "6 أيام",
              imagePath: 'assets/images/home.png',
            ),
            const PropertyCard(
              title: "شقة عصرية بجدة",
              price: "1,200,000 ريال",
              location: "جدة، حي الزهراء",
              status: "متاح",
              timeLeft: "12 يوم",
              imagePath: 'assets/images/home.png',
            ),
          ],
        ),
      ),
    );
  }

  // الـ AppBar العلوي
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF1ED794),
      elevation: 0,
      centerTitle: true,
      title: const Text(
        "العقارات",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      leading: const Icon(Icons.notifications_none, color: Colors.white),
      actions: [
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  // البانر الترويجي
  Widget _buildPromoBanner() {
    return Container(
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
    );
  }

  // صف الفلاتر
  Widget _buildFilterRow() {
    final filters = ["المتوفرة 7", "الممولة (692)", "المباعة (23)"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: filters
          .map(
            (f) => Container(
              margin: const EdgeInsets.only(left: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: f.contains("المتوفرة")
                    ? const Color(0xFF1ED794)
                    : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                f,
                style: TextStyle(
                  fontSize: 12,
                  color: f.contains("المتوفرة") ? Colors.white : Colors.black54,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  // شريط التنقل السفلي
  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF1ED794),
      unselectedItemColor: Colors.grey,
      currentIndex: 3, // العقارات هي المختارة
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "حسابي",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet_outlined),
          label: "المحفظة",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          label: "استكشف",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "الرئيسية",
        ),
      ],
    );
  }
}
