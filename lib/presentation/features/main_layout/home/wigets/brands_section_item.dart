import 'package:ecommerce/domain/model/brand.dart';
import 'package:flutter/material.dart';

class BrandsSectionItem extends StatelessWidget {
  Brand? brand;

  BrandsSectionItem(this.brand, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurStyle: BlurStyle.outer,
                color: Colors.grey,
                blurRadius: 3,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: CircleAvatar(
            backgroundImage: NetworkImage(brand?.image ?? ''),
            radius: 55,
          ),
        ),
      ],
    );
  }
}
