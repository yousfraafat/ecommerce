import 'package:ecommerce/main.dart';
import 'package:ecommerce/presentation/core/widgets/buttons/favorite_button.dart';
import 'package:ecommerce/presentation/core/widgets/product_card/product_card_content.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: MyApp.mainColor.withOpacity(.3), width: 2),
      ),
      child: Stack(
        children: [
          ProductCardContent(
            priceAfterDiscount: 8000,
            priceBeforeDiscount: 9000,
            rating: 4.7,
          ),
          Positioned(
            right: 10,
            top: 10,
            bottom: 10,
            child: Column(
              children: [
                FavoriteButton(isFavorite: isFavorite),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: MyApp.mainColor,
                    child: Icon(Icons.add, color: Colors.white, size: 35),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
