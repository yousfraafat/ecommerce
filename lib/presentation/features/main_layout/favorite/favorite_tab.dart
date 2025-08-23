import 'package:ecommerce/presentation/core/widgets/product_unit.dart';
import 'package:ecommerce/presentation/features/main_layout/favorite/widgets/favorite_unit_button_section.dart';
import 'package:flutter/material.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ProductUnit(button_section: FavoriteUnitButtonSection());
      },
    );
  }
}
