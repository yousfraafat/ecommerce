import 'package:ecommerce/presentation/core/widgets/price_section.dart';
import 'package:ecommerce/presentation/core/widgets/product_unit.dart';
import 'package:ecommerce/presentation/features/cart/widgets/cart_button_section.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class Cart extends StatefulWidget {
  static const String routeName = 'cart';

  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: MyApp.mainColor),
        centerTitle: true,
        title: Text(
          'Cart',
          style: TextStyle(fontWeight: FontWeight.bold, color: MyApp.mainColor),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage('assets/images/search_icon.png'),
                color: MyApp.mainColor,
                size: 30,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage('assets/images/settings_icon.png'),
                color: MyApp.mainColor,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ProductUnit(button_section: CartButtonSection());
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: PriceSection(
              buttonBody: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Check Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(width: 30),
                  Icon(Icons.arrow_right_alt, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
