import 'package:ecommerce/presentation/features/products_screen/products_screen.dart';
import 'package:flutter/material.dart';

class HomeSectionBody<T> extends StatelessWidget {
  List<T> items;
  Widget sectionItem;

  HomeSectionBody({required this.sectionItem, required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                ProductsScreen.routeName,
                arguments: items[index],
              );
            },
            child: sectionItem,
          );
        },
      ),
    );
  }
}
