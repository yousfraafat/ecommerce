import 'package:ecommerce/presentation/core/widgets/price_tag.dart';
import 'package:flutter/material.dart';

import '../../../features/product_details_screen/product_details_screen.dart';

class ProductCardContent extends StatelessWidget {
  double? rating;
  int priceAfterDiscount;
  int? priceBeforeDiscount;

  ProductCardContent({
    required this.priceAfterDiscount,
    this.priceBeforeDiscount,
    this.rating,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.routeName);
      },
      child: Container(
        height: 500,
        width: 210,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: Image.asset(
                  'assets/images/product.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'product name ',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 8),
                    PriceTag(
                      priceAfterDiscount: priceAfterDiscount,
                      priceBeforeDiscount: priceBeforeDiscount,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Review($rating)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        ImageIcon(
                          AssetImage('assets/images/rating_icon.png'),
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
