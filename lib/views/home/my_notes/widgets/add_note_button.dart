import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/home/notes_controller.dart';
import 'package:lab_nerd/widgets/app_loading.dart';

import 'constants.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotesController>(
      builder: (controller) => GestureDetector(
        onTap: () async {
          if (controller.formKey.currentState!.validate()) {
            await controller.addNote();
            Get.back();
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: kPrimary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
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
          ),
        ),
      ),
    );
  }
}
