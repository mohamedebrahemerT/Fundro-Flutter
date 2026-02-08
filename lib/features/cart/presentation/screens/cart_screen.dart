import 'package:fundro_app/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:fundro_app/features/cart/presentation/widgets/order_summary.dart';
import 'package:fundro_app/features/checkout/presentation/screens/checkout_screen.dart';
import 'package:fundro_app/features/checkout/presentation/widgets/checkout_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CheckoutStepper(),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Your Shopping Bag",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const CartItemCard(
              title: "CASHMERE BLEND COAT",
              details: "Medium · Charcoal",
              price: "\$1,250",
              image:
                  "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500",
            ),
            const CartItemCard(
              title: "STRUCTURED LEATHER BAG",
              details: "One Size · Black",
              price: "\$890",
              image:
                  "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500",
            ),
            const OrderSummary(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 55),
                ),
                onPressed: () {
                  Get.to(CheckoutScreen());
                },
                child: const Text(
                  "Proceed to Checkout",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Text(
                "Continue Shopping",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
