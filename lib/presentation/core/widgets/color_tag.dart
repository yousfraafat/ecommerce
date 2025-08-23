import 'package:flutter/material.dart';

class ColorTag extends StatelessWidget {
  const ColorTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 10, backgroundColor: Colors.black),
        SizedBox(width: 5),
        Text(
          'color',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        SizedBox(width: 5),
        Text('|', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
        SizedBox(width: 5),
        Text(
          'size',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
