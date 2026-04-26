import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/images.dart';
import 'package:fundro_app/core/utils/styles.dart';
import 'package:fundro_app/core/utils/dimensions.dart';

import 'package:fundro_app/features/home/presentation/screens/deposit_screen.dart';
import 'package:fundro_app/features/home/presentation/screens/withdrawal_methods_screen.dart';

class HomeActionRow extends StatelessWidget {
  const HomeActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionItem(Images.investIcon, "استثمر", onTap: () => _showInvestBottomSheet(context)),
        _buildActionItem(Images.depositeIcon, "إيداع", onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const DepositScreen()));
        }),
        _buildActionItem(Images.withdrawIcon, "سحب", onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const WithdrawalMethodsScreen()));
        }),
        _buildActionItem(Images.settingsIcon, "اعدادات"),
      ],
    );
  }

  void _showInvestBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 30),
              
              // Item 1: Browse Properties
              _buildBottomSheetItem(
                context: context,
                title: "تصفح العقارات",
                subtitle: "اختر العقارات بنفسك",
                icon: Icons.home_outlined,
                iconBgColor: const Color(0xFFE8F9F1),
                iconColor: const Color(0xFF1ED794),
                onTap: () {
                  Navigator.pop(context);
                  // Add navigation logic here
                },
              ),
              const SizedBox(height: 15),
              
              // Item 2: Auto Investment
              _buildBottomSheetItem(
                context: context,
                title: "خدمة الاستثمار التلقائي",
                subtitle: "ابني محفظة متنوعة تلقائياً",
                icon: Icons.flash_on_outlined,
                iconBgColor: const Color(0xFFE8F9F1),
                iconColor: const Color(0xFF1ED794),
                onTap: () {
                  Navigator.pop(context);
                  // Add navigation logic here
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomSheetItem({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white, // In photo it looks like it might have a very subtle border or shadow
          borderRadius: BorderRadius.circular(15),
          // border: Border.all(color: Colors.grey.shade100),
        ),
        child: Row(
          children: [
            Icon(Icons.arrow_back_ios, size: 16, color: Colors.grey[400]),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: cairoBold.copyWith(fontSize: 16, color: Colors.black),
                ),
                Text(
                  subtitle,
                  style: cairoRegular.copyWith(fontSize: 12, color: Colors.grey[500]),
                ),
              ],
            ),
            const SizedBox(width: 15),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 28),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionItem(String iconPath, String label, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFD144),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(iconPath, color: Colors.black),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
