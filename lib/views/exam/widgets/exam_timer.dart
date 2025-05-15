import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/home/quizzes_controller.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/core/utils/themes/colors_manager.dart';
import 'package:lab_nerd/views/exam/widgets/score_exam_view.dart';

class ExamTimer extends StatefulWidget {
  const ExamTimer({super.key});

  @override
  State<ExamTimer> createState() => _ExamTimerState();
}

class _ExamTimerState extends State<ExamTimer> {
  late final int totalTime;
  final controller = Get.find<QuizzesController>();
  @override
  void initState() {
    totalTime = 5 * 60;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0, 0.15),
      children: [
        Image.asset(
          Assets.imagesTimer,
          height: 210.h,
          width: 210.w,
        ),
        TweenAnimationBuilder<int>(
          tween: IntTween(begin: totalTime, end: 0),
          duration: Duration(minutes: 5),
          builder: (context, secondsLeft, child) {
            int minutes = secondsLeft ~/ 60; // حساب الدقائق المتبقية
            int seconds = secondsLeft % 60; // حساب الثواني المتبقية
            if (secondsLeft == 0) {
              Future.microtask(() {
                Get.to(() => ScoreExamView(score: controller.score));
              });
            }
            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 88.w,
                  height: 88.h,
                  child: CircularProgressIndicator(
                    color: ColorsManager.errorColor,
                    value: secondsLeft / totalTime, // تعديل قيمة المؤشر التقدمي
                    strokeWidth: 10,
                  ),
                ),
                Text(
                  "$minutes:${seconds.toString().padLeft(2, '0')}", // عرض الوقت بصيغة MM:SS
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
