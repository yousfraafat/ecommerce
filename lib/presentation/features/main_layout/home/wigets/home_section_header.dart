import 'package:flutter/material.dart';

class HomeSectionHeader extends StatelessWidget {
  String sectionName;
  VoidCallback? onTap;

  HomeSectionHeader({required this.sectionName, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          sectionName,
          style: TextStyle(
            color: Color(0xff06004F),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: onTap,
          child: Text(
            'view all',
            style: TextStyle(fontSize: 18, color: Color(0xff06004F)),
          ),
        ),
      ],
    );
  }
}
