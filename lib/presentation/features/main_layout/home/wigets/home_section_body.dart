import 'package:ecommerce/main.dart';
import 'package:ecommerce/presentation/features/products_screen/products_screen.dart';
import 'package:flutter/material.dart';

class HomeSectionBody extends StatelessWidget {
  String imageUrl;
  String itemName;
  int itemsCount;

  HomeSectionBody({
    required this.imageUrl,
    required this.itemName,
    required this.itemsCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: itemsCount,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                ProductsScreen.routeName,
                arguments: itemName,
              );
            },
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/home_section_item.png',
                  ),
                  radius: 60,
                ),
                Text(
                  itemName,
                  style: TextStyle(fontSize: 20, color: MyApp.mainColor),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
