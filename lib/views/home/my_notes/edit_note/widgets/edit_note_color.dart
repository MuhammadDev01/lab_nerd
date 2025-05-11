import 'package:flutter/material.dart';
import 'package:lab_nerd/models/note_model.dart';
import 'package:lab_nerd/views/home/my_notes/widgets/color_item.dart';
import 'package:lab_nerd/views/home/my_notes/widgets/constants.dart';

class EditNoteColor extends StatelessWidget {
  const EditNoteColor({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
//        context.read<NotesCubit>().selectedColor = Color(note.color);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: kColors
            .map(
              (color) => GestureDetector(
                onTap: () {
                  //controller.editNoteColor(color);
                  //note.color = color.toARGB32();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: ColorItem(
                    selectedColor: Colors.black,
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
