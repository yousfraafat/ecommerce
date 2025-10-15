import 'package:ecommerce/domain/model/category.dart';
import 'package:ecommerce/main.dart';
import 'package:flutter/material.dart';

class CategoryTabItem extends StatelessWidget {
  Category? category;
  int selectedIndex;
  bool isSelectedCategory;

  CategoryTabItem({
    this.selectedIndex = 0,
    required this.isSelectedCategory,
    this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          selectedIndex == 0
              ? EdgeInsets.only(bottom: 30)
              : EdgeInsets.only(bottom: 15, top: 15),
      decoration: BoxDecoration(
        color: isSelectedCategory ? Colors.white : null,
        borderRadius:
            selectedIndex == 0
                ? BorderRadius.only(topLeft: Radius.circular(15))
                : null,
      ),
      child: Row(
        children: [
          isSelectedCategory
              ? Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                height: 70,
                width: 8,
                decoration: BoxDecoration(
                  color: MyApp.mainColor,
                  borderRadius: BorderRadius.circular(15),
                ),
              )
              : SizedBox(width: 10),
          Expanded(
            child: Text(
              category?.name ?? '',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: MyApp.mainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
