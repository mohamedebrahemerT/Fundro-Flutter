import 'package:fundro_app/features/category/presentation/controllers/category_controller.dart';
import 'package:fundro_app/features/products/presentation/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:fundro_app/features/home/presentation/screens/home_screen.dart';
import 'package:fundro_app/core/helper/custom_snackbar.dart';

class MainLayout extends StatefulWidget {
  final int? initialIndex;
  const MainLayout({super.key, this.initialIndex});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late int _selectedIndex;
  DateTime? lastPressed;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex ?? 0;
    _screens = [
      const HomeScreen(), // HOME
      const Center(child: Text("Categories")), // Placeholder for CATEGORIES
      const Center(child: Text("Wishlist")), // Placeholder for WISHLIST
      const Center(child: Text("Orders")), // Placeholder for ORDERS
      const Center(child: Text("Profile")), // Placeholder for PROFILE
    ];
    Get.find<ProductController>().getProducts();
    Get.find<CategoryController>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex != 0) {
          setState(() {
            _selectedIndex = 0;
          });
          return false;
        }
        DateTime now = DateTime.now();
        if (lastPressed == null ||
            now.difference(lastPressed!) > const Duration(seconds: 2)) {
          lastPressed = now;
          showCustomSnackBar(
            "click_again_to_exit".tr,
            isError: false,
            getXSnackBar: true,
          );
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: IndexedStack(index: _selectedIndex, children: _screens),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade200,
                width: 1,
              ), // الخط الرفيع أعلى البار
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            type: BottomNavigationBarType
                .fixed, // ضروري لإظهار أكثر من 3 عناصر مع نصوصهم
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black, // لون العنصر المختار
            unselectedItemColor: const Color(
              0xFF94A3B8,
            ), // لون العناصر غير المختارة (رمادي مزرق)
            selectedLabelStyle: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Icons.home_outlined),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Icons.home),
                ),
                label: 'HOME',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Icons.grid_view_rounded),
                ),
                label: 'CATEGORIES',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Icons.favorite_border_rounded),
                ),
                label: 'WISHLIST',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Icons.shopping_bag_outlined),
                ),
                label: 'ORDERS',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Icons.person_outline_rounded),
                ),
                label: 'PROFILE',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
