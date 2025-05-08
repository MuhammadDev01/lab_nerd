import 'package:flutter/material.dart';
import 'package:lab_nerd/core/logic/controllers/notes_controller.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';

class NotesBuilder extends StatelessWidget {
  const NotesBuilder({super.key, required this.controller});
  final NotesController controller;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.notes.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                controller.notes[index].title,
                style: TextStyles.rem16Bold,
              ),
              subtitle: Text(
                'controller.notes[index].content',
                style: TextStyles.rem14Bold.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red[700],
                ),
                onPressed: () {
                  //!controller.deleteNote(index);
                },
              ),
            ),
          );
        });
  }
}
