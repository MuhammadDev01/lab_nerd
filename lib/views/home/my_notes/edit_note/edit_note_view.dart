import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/home/notes_controller.dart';
import 'package:lab_nerd/models/note_model.dart';
import 'package:lab_nerd/views/home/my_notes/edit_note/widgets/custom_app_bar.dart';
import 'package:lab_nerd/views/home/my_notes/edit_note/widgets/edit_note_color.dart';
import 'package:lab_nerd/views/home/my_notes/widgets/custom_text_field.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({
    super.key,
    required this.note,
  });
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotesController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomAppBar(
                    text: 'Edit Note',
                    icon: Icons.check,
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.formKey.currentState!.save();
                        updateNote(context);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    title: 'Title',
                    initialValue: note.title,
                    onSaved: (value) {
                      //note.title = value ?? '';
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    title: 'Content',
                    onSaved: (value) {
                      // note.subTitle = value ?? '';
                    },
                    maxLines: 5,
                    initialValue: note.content,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  EditNoteColor(
                    note: note,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void updateNote(BuildContext context) {
    //note.save();
    //context.read<NotesCubit>().fetchNotes();
    Navigator.pop(context);
  }
}
