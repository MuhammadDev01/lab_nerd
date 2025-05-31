import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/main/screens/exam/start_exam_view.dart';
import 'package:lab_nerd/views/components/custom_app_button.dart';

class ExamView extends StatelessWidget {
  const ExamView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '   Exam View 🧪',
          style: TextStyles.rem26Bold.copyWith(color: Colors.white),
        ),
        backgroundColor: ColorsManager.errorColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '📝 This Exam Includes:',
              style: TextStyles.rem26Bold,
            ),
            SizedBox(height: 30),
            buildTopic("1. Chemical Reactions"),
            buildTopic("2. Chemical Symbols"),
            buildTopic("3. Atomic Numbers"),
            buildTopic("4. Balanced Chemical Equations"),
            Spacer(),
            Center(
              child: FittedBox(
                child: Text(
                  '🎯 Are you ready to start the exam?',
                  style: TextStyles.rem20Bold,
                ),
              ),
            ),
            // SizedBox(height: GlobalHelper.isTablet ? 50.h : 20.h),
            Center(
              child: CustomAppButton(
                height: 50,
                width: 80,
                onPressed: () => Get.to(() => StartExamView()),
                colorButton: ColorsManager.errorColor,
                child: Text(
                  'Start Exam',
                  style: TextStyles.rem20Bold.copyWith(color: Colors.white),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget buildTopic(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: ColorsManager.successColor),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text, style: TextStyles.rem20Bold),
          ),
        ],
      ),
    );
  }
}
