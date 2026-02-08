import 'package:fundro_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Theme.of(context).hintColor,
      backgroundColor: Theme.of(context).cardColor,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        if (index == currentIndex) return;

        switch (index) {
          case 0:
         Get.offAll(() =>  SignInScreen());
            
            break;
          case 1:
          Get.to(() => SignInScreen());
        
            break;
          case 2:
          Get.to(() => SignInScreen());
         
            break;
        }
      },
      items:  [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "home_page".tr,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: "orders".tr,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "profile".tr,
        ),
      ],
    );
  }
}
