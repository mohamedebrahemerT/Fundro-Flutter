import 'package:flutter/material.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({
    super.key,
    required this.rate,
  });

  final double rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '(${rate.toStringAsFixed(1)})',
          style: TextStyle(fontSize: 11, color: Theme.of(context).hintColor),
        ),
        SizedBox(width: 4),
        ...[
          for (int i = 0; i < rate.floor(); i++)
            Icon(Icons.star, size: 14, color: Theme.of(context).primaryColor),
          if ((rate - rate.floor()) >= 0.5)
            Icon(Icons.star_half, size: 14, color: Theme.of(context).primaryColor),
          for (int i = 0;
          i <
              5 -
                  rate.floor() -
                  ((rate - rate.floor()) >= 0.5 ? 1 : 0);
          i++)
            Icon(Icons.star_border, size: 14, color: Theme.of(context).primaryColor),
        ],
      ],
    );
  }
}

