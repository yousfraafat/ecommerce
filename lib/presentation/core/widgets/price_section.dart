import 'package:flutter/material.dart';

import 'buttons/custom_button.dart';

class PriceSection extends StatelessWidget {
  Widget buttonBody;

  PriceSection({required this.buttonBody, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Text(
                  'Total price',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '3500 EGP',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: EdgeInsets.only(top: 5),
              child: CustomButton(
                buttonBody: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: buttonBody,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
