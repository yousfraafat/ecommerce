import 'package:ecommerce/main.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  List<Color> colors = [];
  Color selectedColor;

  ColorPicker({required this.selectedColor, required this.colors, super.key});

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: List.generate(widget.colors.length, (index) {
          return buildColorButton(widget.colors[index]);
        }),
      ),
    );
  }

  Widget buildColorButton(Color color) {
    bool isSelected = widget.selectedColor == color;
    return OutlinedButton(
      onPressed: () {
        setState(() {
          widget.selectedColor = color;
        });
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: MyApp.mainColor.withOpacity(.3)),
        shape: CircleBorder(
          side: BorderSide(color: MyApp.mainColor.withOpacity(.3)),
        ),
        backgroundColor: color,
        foregroundColor: color == Colors.white ? MyApp.mainColor : Colors.white,
      ),
      child:
          isSelected
              ? Icon(
                Icons.check,
                color: color == Colors.white ? MyApp.mainColor : Colors.white,
              )
              : null,
    );
  }
}
