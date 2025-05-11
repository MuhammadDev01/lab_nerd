import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/views/exams/widgets/elements_quizzes_view.dart';
import 'package:lab_nerd/widgets/arrow_back_widget.dart';

class ElementsExamsView extends StatefulWidget {
  const ElementsExamsView({super.key});

  @override
  State<ElementsExamsView> createState() => _ElementsExamsViewState();
}

class _ElementsExamsViewState extends State<ElementsExamsView> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? selectedStage; // متغير لتخزين القيمة المختارة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // SvgPicture.asset(
          //   width: double.infinity,
          //   height: double.infinity,
          //   fit: BoxFit.cover,
          //   Assets.imagesSvgBackgroundDark,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButtonFormField<String>(
                      validator: (value) {
                        if (value == null) {
                          return 'Select quiz first!';
                        }
                        return null;
                      },
                      value: selectedStage, // حدد القيمة المختارة هنا
                      hint: const Text('Select Your Quiz'),
                      items: const [
                        DropdownMenuItem(
                          value: 'symbol',
                          child: Text('Symbol Of Element'),
                        ),
                        DropdownMenuItem(
                          value: 'atomic',
                          child: Text('Atomic Number Of Element'),
                        ),
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          selectedStage = value;
                        });
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
                          Get.to(ElementsQuizzesView(
                            id: selectedStage,
                          ));
                        }
                      },
                      child: Text('Go',
                          style: Theme.of(context).textTheme.displaySmall),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30, left: 8),
            child: ArrowbackWidget(
              background: Colors.transparent,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
