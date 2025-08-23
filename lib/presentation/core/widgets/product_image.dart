import 'package:flutter/material.dart';

import '../../../main.dart';

class ProductImage extends StatelessWidget {
  int flex;
  double? margin;
  String image;

  ProductImage({
    this.margin,
    required this.flex,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: EdgeInsets.all(margin ?? 0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: AssetImage('assets/images/product.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: MyApp.mainColor.withOpacity(.3),
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
