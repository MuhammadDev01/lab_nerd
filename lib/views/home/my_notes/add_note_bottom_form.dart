import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/home/notes_controller.dart';
import 'package:lab_nerd/views/home/my_notes/widgets/colors_list_view.dart';
import 'package:lab_nerd/views/home/my_notes/widgets/add_note_button.dart';
import 'package:lab_nerd/views/home/my_notes/widgets/add_note_text_field.dart';

class AddNoteBottomSheetForm extends StatelessWidget {
  AddNoteBottomSheetForm({
    super.key,
  });
  final controller = Get.find<NotesController>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      autovalidateMode: controller.autoValidateMode,
      child: Column(
        children: [
          SizedBox(
            height: 25.h,
          ),
          AddNoteTextFormField(
            controller: controller.titleController,
            title: 'Title',
            validator: (title) =>
                title!.isEmpty ? 'Please enter a title' : null,
          ),
          SizedBox(
            height: 16.h,
          ),
          AddNoteTextFormField(
            controller: controller.contentController,
            title: 'Content',
            maxLines: 5,
            validator: (content) =>
                content!.isEmpty ? 'Please enter some content' : null,
          ),
          SizedBox(
            height: 25.h,
          ),
          const ColorsListView(),
          SizedBox(
            height: 25.h,
          ),
          AddNoteButton(),
        ],
      ),
    );
  }
}
