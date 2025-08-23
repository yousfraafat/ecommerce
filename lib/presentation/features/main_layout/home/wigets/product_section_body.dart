import 'package:ecommerce/presentation/core/widgets/product_card/product_card.dart';
import 'package:flutter/material.dart';

class ProductSectionBody extends StatelessWidget {
  const ProductSectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCard();
        },
      ),
    );
  }
}
