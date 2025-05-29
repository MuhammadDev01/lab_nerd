import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/controllers/home/notes_controller.dart';
import 'package:lab_nerd/views/main/screens/home/my_notes/widgets/color_item.dart';
import 'package:lab_nerd/views/main/screens/home/my_notes/widgets/constants.dart';

class EditNoteColor extends StatefulWidget {
  const EditNoteColor({super.key, required this.noteColorValue});
  final int noteColorValue;

  @override
  State<EditNoteColor> createState() => _EditNoteColorState();
}

class _EditNoteColorState extends State<EditNoteColor> {
  final controller = Get.find<NotesController>();

  @override
  void initState() {
    controller.selectedColor = Color(widget.noteColorValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: kColors
            .map(
              (color) => GestureDetector(
                onTap: () => controller.selectNoteColor(color),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: ColorItem(
                    selectedColor: controller.selectedColor,
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
