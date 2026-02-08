import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  final String title, image, details, price;
  const CartItemCard({super.key, required this.title, required this.image, required this.details, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(image, width: 80, height: 100, fit: BoxFit.cover),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Text(details, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _qtyBtn(Icons.remove),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text("1")),
                    _qtyBtn(Icons.add),
                    const Spacer(),
                    TextButton(onPressed: () {}, child: const Text("Remove", style: TextStyle(color: Colors.grey, decoration: TextDecoration.underline))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _qtyBtn(IconData icon) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
      child: Icon(icon, size: 18),
    );
  }
}