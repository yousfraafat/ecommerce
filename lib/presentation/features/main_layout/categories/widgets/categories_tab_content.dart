import 'package:ecommerce/domain/model/category.dart';
import 'package:ecommerce/presentation/features/main_layout/categories/widgets/category_scroll_bar.dart';
import 'package:ecommerce/presentation/features/main_layout/categories/widgets/category_widget.dart';
import 'package:flutter/material.dart';

class CategoriesTabContent extends StatefulWidget {
  List<Category>? categories;

  CategoriesTabContent(this.categories, {super.key});

  @override
  State<CategoriesTabContent> createState() => _CategoriesTabContentState();
}

class _CategoriesTabContentState extends State<CategoriesTabContent> {
  late Category selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.categories![0];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CategoryScrollBar(widget.categories, onCategoryTap: onCategoryTap),
        SizedBox(width: 15),
        Expanded(flex: 6, child: CategoryWidget(category: selectedCategory)),
      ],
    );
  }

  void onCategoryTap(Category category) {
    setState(() {
      selectedCategory = category;
    });
  }
}
