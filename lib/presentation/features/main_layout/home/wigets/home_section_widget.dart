import 'package:ecommerce/presentation/features/main_layout/home/wigets/home_section_header.dart';
import 'package:flutter/material.dart';

class HomeSectionWidget extends StatelessWidget {
  String sectionName;
  Widget body;
  VoidCallback? onTap;

  HomeSectionWidget({
    required this.sectionName,
    required this.body,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 350,
      width: double.infinity,
      child: Column(
        children: [
          HomeSectionHeader(sectionName: sectionName, onTap: onTap),
          body,
        ],
      ),
    );
  }
}
