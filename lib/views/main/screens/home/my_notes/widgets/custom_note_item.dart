import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/controllers/home/notes_controller.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/models/note_model.dart';
import 'package:lab_nerd/views/main/screens/home/my_notes/edit_note/edit_my_note_view.dart';

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
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                  note.title,
                  style:
                      TextStyles.rem16RegularGrey.copyWith(color: Colors.black),
                ),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                  note.content,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black.withAlpha(126),
                    fontSize: getResponsiveFontSize(fontSize: 18),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Delete Note",
                    titleStyle: TextStyles.rem16RegularGrey,
                    middleText: 'Are you sure delete this note?',
                    middleTextStyle: TextStyles.rem16SemiBold,
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
            Text(
              note.createdAt,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
