import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  int priceAfterDiscount;
  int? priceBeforeDiscount;

  PriceTag({
    this.priceBeforeDiscount,
    required this.priceAfterDiscount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$priceAfterDiscount EGP',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 10),
        Text(
          '$priceBeforeDiscount EGP',

          style: TextStyle(
            decoration: TextDecoration.lineThrough,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
