import 'package:flutter/material.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/views/main/screens/home/my_notes/add_note_bottom_sheet.dart';
import 'widgets/my_notes_view_body.dart';

class MyNotesView extends StatelessWidget {
  const MyNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: MyNotesViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: ColorsManager.darkModeColor,
            isScrollControlled: true,
            useSafeArea: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            context: context,
            builder: (context) => const AddNoteBottomSheet(),
          );
        },
        backgroundColor: ColorsManager.greenWhiteColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
