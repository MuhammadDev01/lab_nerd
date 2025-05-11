import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/home/notes_controller.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/models/note_model.dart';
import 'package:lab_nerd/views/home/my_notes/edit_note/edit_my_note_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(EditMyNoteView(note: note)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Color(note.backgroundColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  note.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                  ),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  note.content,
                  style: TextStyle(
                    color: Colors.black.withAlpha(126),
                    fontSize: 18,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Delete Note",
                    titleStyle: TextStyles.rem20Boldd,
                    middleText: 'Are you sure delete this note?',
                    middleTextStyle: TextStyles.rem16Bold,
                    radius: 10,
                    textCancel: " No ",
                    cancelTextColor:
                        Get.isDarkMode ? Colors.white : Colors.black,
                    textConfirm: " YES ",
                    confirmTextColor: Colors.white,
                    onConfirm: () async {
                      await Get.find<NotesController>().deleteNote(note.id);
                    },
                    buttonColor:
                        Get.isDarkMode ? Colors.blueGrey : Colors.blue[600],
                  );
                },
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.red,
                  size: 26,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                note.createdAt,
                style: TextStyle(
                  color: Colors.black.withAlpha(126),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
