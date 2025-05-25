import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/home/notes_controller.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/home/my_notes/widgets/custom_note_item.dart';
import 'package:lab_nerd/views/home/my_notes/widgets/no_notes_yet.dart';
import 'package:lab_nerd/views/main/widgets/background_gradient.dart';
import 'package:lab_nerd/widgets/app_loading.dart';

class MyNotesViewBody extends StatelessWidget {
  const MyNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundGradient(
      gradient: Get.isDarkMode
          ? ColorsManager.darkHomeGradient
          : ColorsManager.lightHomeGradient,
      child: SafeArea(
        child: GetBuilder<NotesController>(
          builder: (controller) => Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                title: Text(
                  'Notes',
                  style: TextStyles.rem26Bold,
                ),
                centerTitle: true,
              ),
              controller.notes != null
                  ? controller.notes!.isEmpty
                      ? const NoNotesYet()
                      : Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            itemBuilder: (context, index) => CustomNoteItem(
                              note: controller.notes![index],
                            ),
                            itemCount: controller.notes!.length,
                          ),
                        )
                  : Expanded(child: AppLoading())
            ],
          ),
        ),
      ),
    );
  }
}
