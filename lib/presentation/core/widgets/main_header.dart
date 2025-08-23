import 'package:ecommerce/presentation/core/widgets/buttons/cart_button.dart';
import 'package:ecommerce/presentation/core/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(children: [HomeSearchBar(), CartButton()]),
    );
  }
}
