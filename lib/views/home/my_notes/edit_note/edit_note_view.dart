import 'package:flutter/material.dart';
import 'package:lab_nerd/models/note_model.dart';
import 'widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({
    super.key,
    required this.noteModel,
  });
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return EditNoteViewBody(
      note: noteModel,
    );
  }
}
