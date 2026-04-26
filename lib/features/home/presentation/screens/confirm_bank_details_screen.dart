import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:fundro_app/core/utils/styles.dart';
import 'package:fundro_app/core/utils/images.dart';

class ConfirmBankDetailsScreen extends StatelessWidget {
  const ConfirmBankDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Custom AppBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 40),
                  Text(
                    "تأكيد التفاصيل المصرفية",
                    style: cairoBold.copyWith(
                      color: const Color(0xFF1ED794),
                      fontSize: 22,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_forward_ios, size: 22, color: Colors.grey),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Details List
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _buildDetailRow("الإسم الكامل", "Mohamed Farag"),
                    _buildDetailRow("البلد", "Saudi Arabia", flag: Images.arabic),
                    _buildDetailRow("عملة حسابك", "AFN"),
                    _buildDetailRow("IBAN", "321987"),
                    _buildDetailRow("رقم الحساب", "8563201478852044693"),
                    _buildDetailRow("اسم البنك", "Saudi Bank"),
                    _buildDetailRow("اسم الفرع", "Riyadh"),
                    _buildDetailRow("SWFT CODE", "Armenian Dram"),
                  ],
                ),
              ),
            ),
            
            // Footer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "بإضافة حسابك المصرفي فإنك توافق علي الشروط والأحكام والمخاطر الرئيسية",
                textAlign: TextAlign.center,
                style: cairoRegular.copyWith(
                  color: Colors.grey[500],
                  fontSize: 12,
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Confirm Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: const Color(0xFF1ED794),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "قم بتأكيد وحفظ المعلومات",
                    style: cairoBold.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {String? flag}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Value (Left)
          Row(
            children: [
              if (flag != null) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Image.asset(flag, width: 24, height: 16, fit: BoxFit.cover),
                ),
                const SizedBox(width: 8),
              ],
              Text(
                value,
                style: cairoBold.copyWith(
                  color: const Color(0xFF2C5E7A), // Dark blueish color from photo
                  fontSize: 16,
                ),
              ),
            ],
          ),
          // Label (Right)
          Text(
            label,
            style: cairoRegular.copyWith(
              color: const Color(0xFF2C5E7A).withOpacity(0.8),
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
