import 'package:fundro_app/features/checkout/presentation/widgets/checkout_stepper.dart';
import 'package:fundro_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// تأكد من استيراد ملف الـ Stepper الذي صممناه سابقاً
// import 'package:fundro_app/features/products/presentation/widgets/checkout_stepper.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Get.back(), // للعودة للخلف أو للرئيسية
        ),
        title: const Text("BRANDS DEAL", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // إضافة الـ Stepper وتحديد الخطوة الأخيرة (COMPLETE)
          const CheckoutStepper(currentStep: 2),

          const Spacer(flex: 1), // توزيع مساحة مرنة
          // أيقونة الصح (Success Icon)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: const Icon(Icons.check, size: 50, color: Colors.black),
          ),

          const SizedBox(height: 40),

          // نصوص التأكيد
          const Text(
            "THANK YOU FOR YOUR ORDER",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            "YOUR PURCHASE HAS BEEN SUCCESSFULLY CONFIRMED.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 40),

          // تفاصيل الطلب
          const Text(
            "ORDER NUMBER: ORD-2024-8471",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "A CONFIRMATION EMAIL HAS BEEN SENT TO CUSTOMER@EXAMPLE.COM",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),

          const Spacer(flex: 2), // دفع المحتوى للأعلى قليلاً
          // زر العودة للتسوق
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                // العودة إلى صفحة المنتجات الرئيسية
                Get.offAll(() => const HomeScreen());
              },
              child: const Text(
                "CONTINUE SHOPPING",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
