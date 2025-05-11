import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem(
      {super.key, required this.itemColor, required this.selectedColor});
  final Color itemColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return selectedColor == itemColor
        ? CircleAvatar(
            radius: 45,
            backgroundColor: Colors.pink,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: itemColor,
            ),
          )
        : CircleAvatar(
            radius: 34,
            backgroundColor: itemColor,
          );
  }
}
