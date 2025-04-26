import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/app_controller.dart';
import 'package:lab_nerd/models/exam_model.dart';
import 'package:lab_nerd/views/auth/forgot_password/forgot_password_view.dart';

class ExamsView extends StatefulWidget {
  const ExamsView({super.key});

  @override
  State<ExamsView> createState() => _ExamsViewState();
}

class _ExamsViewState extends State<ExamsView> {
  List<ExamModel> modelList = [];
  var controller = Get.find<Appcontroller>();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    //modelList = controller.getExams();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Appcontroller>(builder: (_) {
      return modelList.isEmpty
          ? const LoadingWidget()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButtonFormField<ExamModel>(
                        validator: (value) {
                          if (controller.examID == null) {
                            return 'Select stage first!';
                          }
                          return null;
                        },
                        value: null,
                        hint: const Text('Select Your Stage'),
                        items: modelList.map((element) {
                          return DropdownMenuItem(
                            value: element,
                            child: Text('${element.name}'),
                          );
                        }).toList(),
                        onChanged: (ExamModel? selectedElement) {
                          if (selectedElement != null) {
                            controller.examID = selectedElement.id;
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(50, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (controller.currentIndex != 5) {
                              controller.changeIndexNav(5);
                            }
                          }
                        },
                        child: Text('Go',
                            style: Theme.of(context).textTheme.displaySmall),
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }
}
