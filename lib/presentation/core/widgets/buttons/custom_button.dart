import 'package:flutter/material.dart';

import '../../../../main.dart';

class CustomButton extends StatelessWidget {
  Widget buttonBody;
  double? width;
  double? height;

  CustomButton({this.height, this.width, required this.buttonBody, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: MyApp.mainColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey, offset: Offset(1, 1), blurRadius: 3),
        ],
      ),
      child: buttonBody,
    );
  }
}
