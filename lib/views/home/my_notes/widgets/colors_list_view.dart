import 'package:flutter/material.dart';
import 'package:lab_nerd/views/home/my_notes/widgets/color_item.dart';

import 'constants.dart';

class ColorsListView extends StatelessWidget {
  const ColorsListView({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: kColors
            .map(
              (color) => GestureDetector(
                onTap: () {},
                //  controller.selectNoteColor(color),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ColorItem(
                    selectedColor: Colors.white,
                    //selectedColor: controller.selectedColor,
                    itemColor: color,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
