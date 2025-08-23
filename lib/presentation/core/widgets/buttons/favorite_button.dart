import 'package:ecommerce/main.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  bool isFavorite;

  FavoriteButton({this.isFavorite = false, super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.isFavorite = !widget.isFavorite;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurStyle: BlurStyle.outer,
              color: Colors.grey,
              blurRadius: 3,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 15,
          backgroundColor: Colors.white,
          child: Center(
            child: ImageIcon(
              AssetImage(
                widget.isFavorite == false
                    ? 'assets/images/favorite_icon.png'
                    : 'assets/images/unfavorite_icon.png',
              ),
              color: MyApp.mainColor,
            ),
          ),
        ),
      ),
    );
  }
}
