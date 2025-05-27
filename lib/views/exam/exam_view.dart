import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/exam/start_exam_view.dart';
import 'package:lab_nerd/widgets/custom_app_button.dart';

class ExamView extends StatelessWidget {
  const ExamView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '   Exam View 🧪',
          style: TextStyles.rem26Bold,
        ),
        backgroundColor: ColorsManager.errorColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              Text(
                '📝 This Exam Includes:',
                style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.h),
              buildTopic("1. Chemical Reactions"),
              buildTopic("2. Chemical Symbols"),
              buildTopic("3. Atomic Numbers"),
              buildTopic("4. Balanced Chemical Equations"),
              MediaQuery.sizeOf(context).width > 600
                  ? SizedBox(height: 150.h)
                  : SizedBox(height: 32.h),
              FittedBox(
                child: const Text(
                  '🎯 Are you ready to start the exam?',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              Center(
                child: CustomAppButton(
                  onPressed: () => Get.to(() => StartExamView()),
                  colorButton: ColorsManager.errorColor,
                  child: Text(
                    'Start Exam',
                    style: TextStyles.rem20Bold.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
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
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
