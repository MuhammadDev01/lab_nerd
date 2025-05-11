import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/home/notes_controller.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/models/note_model.dart';
import 'package:lab_nerd/views/home/my_notes/edit_note/widgets/edit_note_color.dart';
import 'package:lab_nerd/views/home/my_notes/widgets/add_note_text_field.dart';
import 'package:lab_nerd/views/main/widgets/background_gradient.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditMyNoteView extends StatelessWidget {
  const EditMyNoteView({
    super.key,
    required this.note,
  });
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotesController>(
      builder: (controller) => Scaffold(
        body: BackgroundGradient(
          gradient: Get.isDarkMode
              ? ColorsManager.darkHomeGradient
              : ColorsManager.lightHomeGradient,
          child: ModalProgressHUD(
            inAsyncCall: controller.isLoading,
            child: SafeArea(
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      title: Text(
                        'Edit Note',
                        style: TextStyles.rem26Bold,
                      ),
                      centerTitle: true,
                      actionsPadding: EdgeInsets.only(right: 18),
                      actions: [
                        IconButton(
                          onPressed: () async {
                            if (controller.formKey.currentState!.validate()) {
                              controller.formKey.currentState!.save();
                              await controller.updateNote(note.id);
                            }
                          },
                          icon: Icon(Icons.check_box_outlined),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          AddNoteTextFormField(
                            title: 'Title',
                            initialValue: note.title,
                            textColor: Colors.black,
                            onSaved: (value) =>
                                controller.titleController.text = value ?? '',
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          AddNoteTextFormField(
                            title: 'Content',
                            textColor: Colors.black,
                            onSaved: (value) =>
                                controller.contentController.text = value ?? '',
                            maxLines: 5,
                            initialValue: note.content,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          EditNoteColor(
                            noteColorValue: note.backgroundColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
