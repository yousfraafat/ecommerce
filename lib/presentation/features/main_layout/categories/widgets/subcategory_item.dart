import 'package:ecommerce/main.dart';
import 'package:ecommerce/presentation/core/widgets/product_image.dart';
import 'package:ecommerce/presentation/features/products_screen/products_screen.dart';
import 'package:flutter/material.dart';

class SubcategoryItem extends StatelessWidget {
  String? subcategoryName;
  String? categoryImage;

  SubcategoryItem({
    required this.subcategoryName,
    this.categoryImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductsScreen.routeName,
          arguments: subcategoryName,
        );
      },
      child: Column(
        children: [
          ProductImage(
            flex: 1,
            image: categoryImage ?? 'assets/images/product.png',
            margin: 5,
          ),
          Text(
            subcategoryName ?? '',
            style: TextStyle(fontSize: 15, color: MyApp.mainColor),
          ),
        ],
      ),
    );
  }
}
