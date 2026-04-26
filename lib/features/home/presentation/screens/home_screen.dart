import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';
import 'package:fundro_app/features/home/domain/models/property_model.dart';
import 'package:fundro_app/features/home/presentation/screens/notifications_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/app_bar_home.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/filter_row.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/property_card.dart';
import 'package:fundro_app/features/home/presentation/screens/investment_center_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/home_banners_section.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/wallet_summary.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/home_header.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/home_action_row.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/earn_with_fundro_card.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/start_journey_banner.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/investment_projector_card.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/investment_analytics_lock.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/insight_banners_scroll.dart';
import 'package:fundro_app/features/home/presentation/screens/exit_window_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/account_setup_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/rewards_banner_carousel.dart';
import 'package:fundro_app/features/home/presentation/screens/widgets/wallet_sections.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PropertyFilter _selectedFilter = PropertyFilter.available;
  int _currentIndex = 3;

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
      appBar: _currentIndex == 3
          ? const AppBarHome(title: "العقارات")
          : _currentIndex == 1
              ? const AppBarHome(title: "المحفظة")
              : null,
      bottomNavigationBar: _buildBottomNav(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 3:
        return _buildHomeContent();
      case 2:
        return _buildPortfolioContent();
      case 1:
        return _buildWalletContent();
      case 0:
        return const Center(child: Text("حسابي (قريباً)"));
      default:
        return _buildHomeContent();
    }
  }

  Widget _buildWalletContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(height: 15),
          HomeHeader(
            onMenuTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InvestmentCenterScreen(),
                ),
              );
            },
            onNotificationTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          RewardsBannerCarousel(),
          SizedBox(height: 20),
          HomeActionRow(),
          const WalletPaymentCard(),
          const TransactionSection(),
          const SecurityTrustCard(),
          const AcademyCarousel(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildPortfolioContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
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
                  decoration: const BoxDecoration(
                    color: Color(0xFF1ED794),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.menu, color: Colors.white),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF1ED794)),
                ),
                child: Row(
                  children: [
                    Image.asset(Images.dubai, height: 20),
                    const SizedBox(width: 5),
                    const Text(
                      "AED",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Image.asset('assets/images/logo.png', height: 30),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.black,
              ),
            ],
          ),
          const WalletSummary(amount: "AED 1000.00"),
          const HomeActionRow(),
          const EarnWithFundroCard(),
          const StartJourneyBanner(),
          const InvestmentProjectorCard(),
          const InvestmentAnalyticsLock(),
          const InsightBannersScroll(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(height: 15),
          HomeHeader(
            onMenuTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InvestmentCenterScreen(),
                ),
              );
            },
            onNotificationTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsScreen(),
                ),
              );
            },
          ),

          HomeBannersSection(
            onExitWindowTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExitWindowScreen(),
                ),
              );
            },
            onAccountSetupTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccountSetupScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 20),

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
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // شريط التنقل السفلي
  Widget _buildBottomNav() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(0, Icons.person_outline, "حسابي"),
            _buildNavItem(1, Icons.wallet_outlined, "المحفظة"),
            _buildNavItem(2, Icons.pie_chart_outline, "الملف"),
            _buildNavItem(3, Icons.home_outlined, "الرئيسية"),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFCF8E8) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFF1ED794) : Colors.black45,
              size: 26,
            ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF1ED794),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
