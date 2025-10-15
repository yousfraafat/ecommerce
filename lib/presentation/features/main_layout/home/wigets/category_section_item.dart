import 'package:ecommerce/domain/model/category.dart';
import 'package:flutter/material.dart';

import '../../../../../main.dart';

class CategorySectionItem extends StatelessWidget {
  Category? category;

  CategorySectionItem(this.category, {super.key});

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
            backgroundImage: NetworkImage(category?.image ?? ''),
            radius: 55,
          ),
        ),
        Text(
          category?.name ?? 'category',
          style: TextStyle(fontSize: 16, color: MyApp.mainColor),
        ),
      ],
    );
  }
}
