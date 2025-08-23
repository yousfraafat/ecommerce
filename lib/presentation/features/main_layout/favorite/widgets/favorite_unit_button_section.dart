import 'package:flutter/material.dart';

import '../../../../core/widgets/buttons/custom_button.dart';
import '../../../../core/widgets/buttons/favorite_button.dart';

class FavoriteUnitButtonSection extends StatefulWidget {
  FavoriteUnitButtonSection({super.key});

  @override
  State<FavoriteUnitButtonSection> createState() =>
      _FavoriteUnitButtonSectionState();
}

class _FavoriteUnitButtonSectionState extends State<FavoriteUnitButtonSection> {
  bool isFavorite = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            child: FavoriteButton(isFavorite: isFavorite),
          ),
          CustomButton(
            width: 90,
            height: 40,
            buttonBody: Center(
              child: Text(
                'Add to Cart',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
