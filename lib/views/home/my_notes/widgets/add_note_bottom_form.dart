import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/notes_controller.dart';
import 'package:lab_nerd/views/widgets/colors_list_view.dart';
import 'package:lab_nerd/views/widgets/custom_button.dart';
import 'package:lab_nerd/views/widgets/custom_text_field.dart';

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
            CustomTextFormField(
              controller: controller.titleController,
              title: 'Title',
              validator: (title) =>
                  title!.isEmpty ? 'Please enter a title' : null,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              controller: controller.subTitleController,
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
            CustomButton(
              onTap: () => addNote(controller),
            ),
          ],
        ),
      ),
    );
  }

  void addNote(NotesController controller) {
    if (controller.formKey.currentState!.validate()) {
      // cubit.addNote(NoteModel(
      //     title: cubit.titleController.text,
      //     subTitle: cubit.subTitleController.text,
      //     date: cubit.formattedCurrentDate,
      //     color: cubit.selectedColor.toARGB32()));
    } else {
      // cubit.autoValidateMode = AutovalidateMode.always;
    }
  }
}
