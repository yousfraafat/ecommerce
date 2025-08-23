import 'package:ecommerce/presentation/core/widgets/buttons/custom_button.dart';
import 'package:ecommerce/presentation/core/widgets/product_counter.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';

class CartButtonSection extends StatefulWidget {
  const CartButtonSection({super.key});

  @override
  State<CartButtonSection> createState() => _CartButtonSectionState();
}

class _CartButtonSectionState extends State<CartButtonSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: ImageIcon(
              AssetImage('assets/images/delete_icon.png'),
              color: MyApp.mainColor,
            ),
          ),
          CustomButton(height: 40, width: 90, buttonBody: ProductCounter()),
        ],
      ),
    );
  }
}
