import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:lab_nerd/core/logic/controllers/home/notes_controller.dart';
import 'package:lab_nerd/views/home/my_notes/widgets/color_item.dart';

import 'constants.dart';

class ColorsListView extends StatelessWidget {
  const ColorsListView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotesController>(
      builder: (controller) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: kColors
              .map(
                (color) => GestureDetector(
                  onTap: () => controller.selectNoteColor(color),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ColorItem(
                      selectedColor: controller.selectedColor,
                      itemColor: color,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
