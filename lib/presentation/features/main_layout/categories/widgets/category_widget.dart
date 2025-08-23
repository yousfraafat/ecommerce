import 'package:ecommerce/presentation/features/main_layout/categories/widgets/subcategory_widget.dart';
import 'package:flutter/material.dart';

import 'category_header.dart';

class CategoryWidget extends StatelessWidget {
  String categoryName;

  CategoryWidget({required this.categoryName, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: Text(
              categoryName,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          CategoryHeader(categoryName: categoryName),
          SizedBox(height: 15),
          Expanded(flex: 15, child: SubcategoryWidget()),
        ],
      ),
    );
  }
}
