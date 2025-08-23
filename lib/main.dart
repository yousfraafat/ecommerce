import 'package:ecommerce/presentation/features/cart/cart.dart';
import 'package:ecommerce/presentation/features/main_layout/main_screen.dart';
import 'package:ecommerce/presentation/features/product_details_screen/product_details_screen.dart';
import 'package:ecommerce/presentation/features/products_screen/products_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const Color mainColor = Color(0xff004182);

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainScreen.routeName,
      routes: {
        MainScreen.routeName: (_) => MainScreen(),
        ProductsScreen.routeName: (_) => ProductsScreen(),
        Cart.routeName: (_) => Cart(),
        ProductDetailsScreen.routeName: (_) => ProductDetailsScreen(),
      },
    );
  }
}
