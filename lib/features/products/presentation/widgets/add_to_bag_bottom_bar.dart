import 'package:flutter/material.dart';

class AddToBagBottomBar extends StatelessWidget {
  const AddToBagBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Quantity"),
              Row(
                children: [
                  _qtyBtn(Icons.remove),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 15), child: Text("1")),
                  _qtyBtn(Icons.add),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: const Size(double.infinity, 55),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
            onPressed: () {},
            child: const Text("Add to Bag", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _qtyBtn(IconData icon) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade100, shape: BoxShape.circle),
      child: Icon(icon, size: 20),
    );
  }
}