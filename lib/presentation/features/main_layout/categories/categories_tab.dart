import 'package:ecommerce/presentation/features/main_layout/categories/widgets/category_scroll_bar.dart';
import 'package:ecommerce/presentation/features/main_layout/categories/widgets/category_widget.dart';
import 'package:flutter/material.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CategoryScrollBar(),
        SizedBox(width: 5),
        Expanded(flex: 8, child: CategoryWidget(categoryName: 'Category name')),
      ],
    );
  }
}
