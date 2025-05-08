import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/notes_controller.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/views/home/my_notes/widgets/notes_builder.dart';
import 'package:lab_nerd/views/main/widgets/image_backround.dart';
import 'package:lab_nerd/widgets/default_text_form_field.dart';

class MyNotesView extends StatefulWidget {
  const MyNotesView({super.key});

  @override
  State<MyNotesView> createState() => _MyNotesViewState();
}

class _MyNotesViewState extends State<MyNotesView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final controller = Get.put(NotesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ImageBackground(
        backgroundHome: Assets.imagesSvgBackground2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SafeArea(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultTextFormField(
                      controller: controller.titleController,
                      hintText: 'Enter title',
                      textInputType: TextInputType.text,
                      helperText: 'Title',
                    ),
                    const SizedBox(height: 10),
                    DefaultTextFormField(
                        controller: controller.contentController,
                        minLines: 8,
                        contentPadding: const EdgeInsets.all(8),
                        maxLines: null,
                        hintText: 'Enter content',
                        textInputType: TextInputType.text,
                        helperText: 'Content'),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          //!controller.addNote();
                        }
                      },
                      child: Text(
                        'Add Note',
                        style: TextStyles.slacksideOnes20Bold,
                      ),
                    ),
                    NotesBuilder(controller: controller),
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
