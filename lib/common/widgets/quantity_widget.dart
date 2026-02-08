import 'package:flutter/material.dart';
import 'package:fundro_app/core/utils/dimensions.dart';

class QuantityWidget extends StatelessWidget {
  final int quantity;
  final bool isLoading;
  final bool isFromItemDetails;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantityWidget({
    super.key,
    this.isLoading = false,
    this.isFromItemDetails = false,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: onDecrement,
            icon: Icon(quantity==1 && !isFromItemDetails?Icons.delete:Icons.remove_circle_outline,
                color: Theme.of(context).primaryColor, size: 20),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
           SizedBox(width: Dimensions.width * 0.001),
         isLoading?SizedBox(
          height: 15,
          width: 15,
          child: CircularProgressIndicator()): Text(
            quantity.toString(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          // SizedBox(width: Dimensions.width * 0.02),
          IconButton(
            onPressed: onIncrement,
            icon: Icon(Icons.add_circle_outline,
                color: Theme.of(context).primaryColor, size: 20),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
