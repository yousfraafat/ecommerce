import 'package:ecommerce/main.dart';
import 'package:flutter/material.dart';

class NoDataStateWidget extends StatelessWidget {
  const NoDataStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'no data',
        style: TextStyle(color: MyApp.mainColor, fontSize: 15),
      ),
    );
  }
}
