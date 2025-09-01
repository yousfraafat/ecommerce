import 'package:ecommerce/presentation/core/widgets/main_header.dart';
import 'package:ecommerce/presentation/core/widgets/product_card/product_card.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../auth/profile_screen.dart';

class ProductsScreen extends StatelessWidget {
  static const String routeName = 'Products Screen';

  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: MyApp.mainColor),
        centerTitle: true,
        title: Text(
          args.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, color: MyApp.mainColor),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ProfileScreen.routeName);
              },
              icon: ImageIcon(
                AssetImage('assets/images/profile_icon.png'),
                color: MyApp.mainColor,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          MainHeader(),
          Expanded(
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .75,
              ),
              itemBuilder: (context, index) {
                return ProductCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
