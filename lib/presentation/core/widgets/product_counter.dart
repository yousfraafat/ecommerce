import 'package:flutter/material.dart';

class ProductCounter extends StatefulWidget {
  const ProductCounter({super.key});

  @override
  State<ProductCounter> createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            if (counter <= 1) {
              return;
            }
            setState(() {
              counter--;
            });
          },
          child: Icon(Icons.remove_circle_outline, color: Colors.white),
        ),
        Text(
          '$counter',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              counter++;
            });
          },
          child: Icon(Icons.add_circle_outline, color: Colors.white),
        ),
      ],
    );
  }
}
