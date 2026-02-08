import 'package:flutter/material.dart';

class CustomProductsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackTap;
  final VoidCallback? onSearchTap;
  final VoidCallback? onFilterTap;

  const CustomProductsAppBar({
    super.key,
    this.title = 'Products',
    this.onBackTap,
    this.onSearchTap,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0, // لإزالة الظل وجعله مسطحاً كالصورة
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: onBackTap ?? () => Navigator.pop(context),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: true, // لجعل كلمة Products في المنتصف
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.black, size: 28),
          onPressed: onSearchTap,
        ),
        IconButton(
          icon: const Icon(Icons.tune, color: Colors.black, size: 28), // أيقونة الفلتر
          onPressed: onFilterTap,
        ),
        const SizedBox(width: 8), // مسافة بسيطة في النهاية
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}