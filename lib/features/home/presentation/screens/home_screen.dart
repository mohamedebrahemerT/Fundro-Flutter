import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:fundro_app/features/home/domain/models/property_model.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/app_bar_home.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/filter_row.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/property_card.dart';
import 'package:fundro_app/features/home/presentation/screens/notifications_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/investment_center_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/exit_window_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/account_setup_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/promo_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PropertyFilter _selectedFilter = PropertyFilter.available;

  /// قائمة كاملة من العقارات بحالات مختلفة لاختبار الفلتر
  final List<PropertyModel> _allProperties = const [
    PropertyModel(
      title: "فيلا فاخرة في الرياض",
      price: "2,500,000 ريال",
      location: "الرياض، حي النرجس",
      status: "متاح",
      timeLeft: "6 أيام",
      imagePath: 'assets/images/home.png',
    ),
    PropertyModel(
      title: "شقة عصرية بجدة",
      price: "1,200,000 ريال",
      location: "جدة، حي الزهراء",
      status: "متاح",
      timeLeft: "12 يوم",
      imagePath: 'assets/images/home.png',
    ),
    PropertyModel(
      title: "مجمع تجاري في الدمام",
      price: "5,800,000 ريال",
      location: "الدمام، حي الشاطئ",
      status: "متاح",
      timeLeft: "3 أيام",
      imagePath: 'assets/images/home.png',
    ),
    PropertyModel(
      title: "برج سكني في الرياض",
      price: "12,000,000 ريال",
      location: "الرياض، العليا",
      status: "ممولة",
      timeLeft: "منتهية",
      imagePath: 'assets/images/home.png',
    ),
    PropertyModel(
      title: "مستودع لوجستي بالمدينة",
      price: "3,400,000 ريال",
      location: "المدينة المنورة، المنطقة الصناعية",
      status: "ممولة",
      timeLeft: "منتهية",
      imagePath: 'assets/images/home.png',
    ),
    PropertyModel(
      title: "شاليه ساحلي بالعقير",
      price: "950,000 ريال",
      location: "الأحساء، العقير",
      status: "ممولة",
      timeLeft: "منتهية",
      imagePath: 'assets/images/home.png',
    ),
    PropertyModel(
      title: "فيلا راقية في مكة",
      price: "4,200,000 ريال",
      location: "مكة المكرمة، العزيزية",
      status: "مباع",
      timeLeft: "مباع",
      imagePath: 'assets/images/home.png',
    ),
    PropertyModel(
      title: "أرض تجارية في تبوك",
      price: "780,000 ريال",
      location: "تبوك، حي الروضة",
      status: "مباع",
      timeLeft: "مباع",
      imagePath: 'assets/images/home.png',
    ),
  ];

  /// تصفية العقارات حسب الفلتر المختار
  List<PropertyModel> get _filteredProperties {
    switch (_selectedFilter) {
      case PropertyFilter.available:
        return _allProperties.where((p) => p.status == 'متاح').toList();
      case PropertyFilter.funded:
        return _allProperties.where((p) => p.status == 'ممولة').toList();
      case PropertyFilter.sold:
        return _allProperties.where((p) => p.status == 'مباع').toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarHome(),
      bottomNavigationBar: _buildBottomNav(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              spacing: Dimensions.width * 0.05,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InvestmentCenterScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.menu, color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationsScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.green),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.notifications_none,
                      color: Colors.green,
                    ),
                  ),
                ),
                Spacer(),
                Image.asset(
                  'assets/images/logo.png',
                  // width: Dimensions.width * 0.1,
                ),
              ],
            ),
            // بانر التوعية (الأخضر والأصفر)
            const SizedBox(height: 15),
            PromoBanner(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExitWindowScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 6),
            PromoBanner(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AccountSetupScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 15),
            // الفلاتر التفاعلية
            FilterRow(
              selectedFilter: _selectedFilter,
              onFilterChanged: (filter) {
                setState(() => _selectedFilter = filter);
              },
            ),
            const SizedBox(height: 20),
            // قائمة العقارات المُصفّاة
            ..._filteredProperties
                .map(
                  (p) => PropertyCard(
                    title: p.title,
                    price: p.price,
                    location: p.location,
                    status: p.status,
                    timeLeft: p.timeLeft,
                    imagePath: p.imagePath,
                  ),
                )
                .toList(),
            // رسالة عند عدم وجود نتائج
            if (_filteredProperties.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: Column(
                  children: [
                    Icon(
                      Icons.search_off_rounded,
                      size: 60,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "لا توجد عقارات في هذه الفئة",
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  // شريط التنقل السفلي
  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF1ED794),
      unselectedItemColor: Colors.grey,
      currentIndex: 3,
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
