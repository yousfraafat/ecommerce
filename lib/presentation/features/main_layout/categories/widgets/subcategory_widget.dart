import 'package:ecommerce/presentation/features/main_layout/categories/widgets/subcategory_item.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/model/subcategory.dart';

class SubcategoryWidget extends StatelessWidget {
  List<Subcategory>? subcategories;
  String? categoryImage;

  SubcategoryWidget(this.subcategories, this.categoryImage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: subcategories?.length,
        itemBuilder: (context, index) {
          return SubcategoryItem(
            subcategoryName: subcategories![index].name,
            categoryImage: categoryImage,
          );
        },
      ),
    );
  }
}
