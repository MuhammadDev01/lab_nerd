import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/home/notes_controller.dart';
import 'package:lab_nerd/views/home/my_notes/widgets/colors_list_view.dart';
import 'package:lab_nerd/views/home/my_notes/widgets/add_note_button.dart';
import 'package:lab_nerd/views/home/my_notes/widgets/add_note_text_field.dart';
import 'package:lab_nerd/widgets/app_loading.dart';

class AddNoteBottomSheetForm extends StatelessWidget {
  const AddNoteBottomSheetForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotesController>(
      builder: (controller) => Form(
        key: controller.formKey,
        autovalidateMode: controller.autoValidateMode,
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            AddNoteTextFormField(
              controller: controller.titleController,
              title: 'Title',
              validator: (title) =>
                  title!.isEmpty ? 'Please enter a title' : null,
            ),
            const SizedBox(
              height: 16,
            ),
            AddNoteTextFormField(
              controller: controller.contentController,
              title: 'Content',
              maxLines: 5,
              validator: (content) =>
                  content!.isEmpty ? 'Please enter some content' : null,
            ),
            const SizedBox(
              height: 25,
            ),
            const ColorsListView(),
            const SizedBox(
              height: 25,
            ),
            AddNoteButton(
              child: controller.isLoading
                  ? AppLoading()
                  : Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              onTap: () async {
                if (controller.formKey.currentState!.validate()) {
                  controller.changeLoading();
                  await controller.addNote();
                  controller.changeLoading();
                  Get.back();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
