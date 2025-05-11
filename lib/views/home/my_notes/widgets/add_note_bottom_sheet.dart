import 'package:flutter/material.dart';
import 'package:lab_nerd/views/home/my_notes/widgets/add_note_bottom_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 16,
        left: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: const SingleChildScrollView(
        child: AddNoteBottomSheetForm(),
      ),
    );
  }
}
