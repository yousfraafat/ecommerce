import 'package:ecommerce/main.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  List<int> sizes = [];
  int selectedSize;

  SizePicker({required this.selectedSize, required this.sizes, super.key});

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: List.generate(widget.sizes.length, (index) {
          return buildSizeButton(widget.sizes[index]);
        }),
      ),
    );
  }

  Widget buildSizeButton(int size) {
    bool isSelected = widget.selectedSize == size;
    return OutlinedButton(
      onPressed: () {
        setState(() {
          widget.selectedSize = size;
        });
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: MyApp.mainColor.withOpacity(.3)),
        shape: CircleBorder(
          side: BorderSide(color: MyApp.mainColor.withOpacity(.3)),
        ),
        backgroundColor: isSelected ? MyApp.mainColor : Colors.white,
        foregroundColor: isSelected ? Colors.white : MyApp.mainColor,
      ),
      child: Text('$size'),
    );
  }
}
