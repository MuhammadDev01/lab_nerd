import 'package:flutter/material.dart';

class NoteAppBody extends StatelessWidget {
  const NoteAppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 18),
      itemBuilder: (context, index) => Container(),
      // CustomNoteItem(

      //   note: controller.notes[index],
      // ),
      //itemCount: context.read<NotesCubit>().notes.length,
      itemCount: 5,
    );
  }
}
