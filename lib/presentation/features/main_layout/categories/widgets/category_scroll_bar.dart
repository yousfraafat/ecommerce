import 'package:ecommerce/presentation/features/main_layout/categories/widgets/category_tab_item.dart';
import 'package:flutter/material.dart';

import '../../../../../main.dart';

class CategoryScrollBar extends StatefulWidget {
  CategoryScrollBar({super.key});

  @override
  State<CategoryScrollBar> createState() => _CategoryScrollBarState();
}

class _CategoryScrollBarState extends State<CategoryScrollBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Color(0xFFDBE4ED),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
          border: BorderDirectional(
            top: BorderSide(color: MyApp.mainColor.withOpacity(.3), width: 1.5),
            bottom: BorderSide(
              color: MyApp.mainColor.withOpacity(.3),
              width: 1.5,
            ),
            start: BorderSide(
              color: MyApp.mainColor.withOpacity(.3),
              width: 1.5,
            ),
          ),
        ),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: CategoryTabItem(
                selectedIndex: selectedIndex,
                isSelectedCategory: selectedIndex == index,
              ),
            );
          },
        ),
      ),
    );
  }
}
