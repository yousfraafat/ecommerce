import 'package:ecommerce/presentation/features/main_layout/categories/widgets/subcategory_item.dart';
import 'package:flutter/material.dart';

class SubcategoryWidget extends StatelessWidget {
  const SubcategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return SubcategoryItem(subcategoryName: 'subcategory');
      },
    );
  }
}
