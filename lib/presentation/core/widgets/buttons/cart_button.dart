import 'package:ecommerce/presentation/features/cart/cart.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, Cart.routeName);
      },
      icon: ImageIcon(
        AssetImage('assets/images/shopping_cart_icon.png'),
        color: MyApp.mainColor,
        size: 50,
      ),
    );
  }
}
