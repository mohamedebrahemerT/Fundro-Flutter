import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:fundro_app/core/utils/styles.dart';
import 'package:fundro_app/theme/custom_decoration.dart';

/// AppBar الرئيسي لشاشة العقارات
/// يطابق التصميم: خلفية خضراء، عنوان "العقارات" في المنتصف بخط أبيض عريض
class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  @override
  Size get preferredSize => Size.fromHeight(Dimensions.height * 0.09);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height * 0.9,
      alignment: Alignment.center,
      decoration: CustomDecoration.getDecoration(
        context: context,
        color: const Color(0xFF1ED794),
        borderRadiusDirection: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Text(
        "العقارات",
        style: cairoBold.copyWith(
          color: Colors.white,
          fontSize: Dimensions.fontSizeExtraLarge,
        ),
      ),
    );
    //  AppBar(
    //   backgroundColor: const Color(0xFF1ED794),
    //   elevation: 0,
    //   centerTitle: true,
    //   title: const Text(
    //     "العقارات",
    //     style: TextStyle(
    //       color: Colors.white,
    //       fontWeight: FontWeight.bold,
    //       fontSize: 18,
    //       letterSpacing: 0.5,
    //     ),
    //   ),
    //   leading: IconButton(
    //     icon: const Icon(Icons.notifications_none, color: Colors.white),
    //     onPressed: () {},
    //   ),
    //   actions: [
    //     IconButton(
    //       icon: const Icon(Icons.menu, color: Colors.white),
    //       onPressed: () {},
    //     ),
    //   ],
    // );
  }
}
