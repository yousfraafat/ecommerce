import 'package:flutter/material.dart';

import '../../../../main.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 20),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(width: 2, color: MyApp.mainColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: 2, color: MyApp.mainColor),
            ),
            prefixIcon: ImageIcon(
              AssetImage('assets/images/search_icon.png'),
              color: MyApp.mainColor,
            ),
            hintText: 'what do you search for?',
          ),
        ),
      ),
    );
  }
}
