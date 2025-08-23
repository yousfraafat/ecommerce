import 'package:ecommerce/main.dart';
import 'package:ecommerce/presentation/core/widgets/color_tag.dart';
import 'package:ecommerce/presentation/core/widgets/price_tag.dart';
import 'package:ecommerce/presentation/core/widgets/product_image.dart';
import 'package:ecommerce/presentation/features/product_details_screen/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductUnit extends StatelessWidget {
  Widget button_section;

  ProductUnit({required this.button_section, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: MyApp.mainColor.withOpacity(.3), width: 1.5),
      ),
      child: SizedBox(
        height: 120,
        width: double.infinity,
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, ProductDetailsScreen.routeName);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ProductImage(flex: 3, image: 'assets/images/product.png'),
                  SizedBox(width: 10),
                  Flexible(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'product name',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ColorTag(),
                        PriceTag(
                          priceAfterDiscount: 8000,
                          priceBeforeDiscount: 9000,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(bottom: 1, top: 1, right: 10, child: button_section),
          ],
        ),
      ),
    );
  }
}
