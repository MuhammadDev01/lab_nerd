import 'package:flutter/material.dart';
import 'package:lab_nerd/views/home/my_notes/widgets/add_note_bottom_sheet.dart';
import '../../widgets/note_app_body.dart';

class MyNotesView extends StatelessWidget {
  const MyNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notes',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: NoteAppBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) => const AddNoteBottomSheet(),
            );
          },
          child: const Icon(Icons.add),
        ));
  }
}
