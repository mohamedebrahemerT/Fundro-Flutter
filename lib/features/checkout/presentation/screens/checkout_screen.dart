import 'package:fundro_app/features/cart/presentation/widgets/order_summary.dart';
import 'package:fundro_app/features/checkout/presentation/screens/order_success_screen.dart';
import 'package:fundro_app/features/checkout/presentation/widgets/checkout_stepper.dart';
import 'package:fundro_app/features/checkout/presentation/widgets/custom_checkoutout_field.dart';
import 'package:fundro_app/features/checkout/presentation/widgets/section_header.dart';
import 'package:fundro_app/features/checkout/presentation/widgets/selection_option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text("BRANDS DEAL", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CheckoutStepper(
              currentStep: 1,
            ), // الـ Widget اللي عملناه في الخطوة السابقة

            const SectionHeader(title: "Contact Information"),
            const CustomCheckoutField(
              label: "Email Address",
              hint: "your.email@example.com",
            ),
            const CustomCheckoutField(
              label: "Phone Number",
              hint: "+1 (555) 000-0000",
            ),

            const SectionHeader(title: "Shipping Address"),
            const CustomCheckoutField(label: "Full Name", hint: "John Doe"),
            const CustomCheckoutField(
              label: "Address",
              hint: "123 Fashion Avenue",
            ),
            Row(
              children: [
                Expanded(
                  child: CustomCheckoutField(label: "City", hint: "New York"),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomCheckoutField(label: "Zip Code", hint: "10001"),
                ),
              ],
            ),
            const CustomCheckoutField(label: "Country", hint: "United States"),

            const SectionHeader(title: "Shipping Method"),
            const SelectionOption(
              title: "Standard Delivery",
              subtitle: "5-7 business days",
              trailing: "Free",
              isSelected: true,
            ),
            const SelectionOption(
              title: "Express Delivery",
              subtitle: "2-3 business days",
              trailing: "\$25",
              isSelected: false,
            ),

            const SectionHeader(title: "Payment Method"),
            const SelectionOption(
              title: "Credit / Debit Card",
              trailing: "",
              isSelected: true,
            ),
            const SelectionOption(
              title: "Digital Wallets",
              subtitle: "Apple Pay · Google Pay",
              trailing: "",
              isSelected: false,
            ),

            const Divider(height: 40),
            const OrderSummary(), // استدعاء ملخص الطلب من الصفحة السابقة

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0A0E16),
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Get.to(OrderSuccessScreen());
              },
              child: const Text(
                "PLACE ORDER",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildSecureNote(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSecureNote() {
    return Column(
      children: [
        _iconLabel(Icons.lock_outline, "Secure checkout"),
        _iconLabel(Icons.refresh, "Free returns within 30 days"),
        _iconLabel(Icons.card_giftcard, "Complimentary gift wrapping"),
      ],
    );
  }

  Widget _iconLabel(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 16, color: Colors.grey),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}
