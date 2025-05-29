import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/helper/global_helper.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/views/main/screens/exam/widgets/exam_score_view.dart';

class ExamTimer extends StatefulWidget {
  const ExamTimer({super.key});

  @override
  State<ExamTimer> createState() => _ExamTimerState();
}

class _ExamTimerState extends State<ExamTimer> {
  late final int totalTime;
  @override
  void initState() {
    totalTime = 5 * 60;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0, 0.17),
      children: [
        Image.asset(
          Assets.imagesTimer,
          height: GlobalHelper.isTablet ? 400.h : 205.h,
        ),
        TweenAnimationBuilder<int>(
          tween: IntTween(begin: totalTime, end: 0),
          duration: Duration(minutes: 5),
          builder: (context, secondsLeft, child) {
            int minutes = secondsLeft ~/ 60; // حساب الدقائق المتبقية
            int seconds = secondsLeft % 60; // حساب الثواني المتبقية
            if (secondsLeft == 0) {
              Future.microtask(() {
                Get.to(() => ExamScoreView());
              });
            }
            return Stack(
              alignment: Alignment.center,
              children: [
                Transform.scale(
                  scaleX: -1,
                  child: SizedBox(
                    height: GlobalHelper.isTablet ? 160 : 80,
                    width: GlobalHelper.isTablet ? 160 : 80,
                    child: CircularProgressIndicator(
                      color: ColorsManager.errorColor,
                      value:
                          secondsLeft / totalTime, // تعديل قيمة المؤشر التقدمي
                      strokeWidth: GlobalHelper.isTablet ? 10 : 6,
                    ),
                  ),
                ),
                Text(
                  "$minutes:${seconds.toString().padLeft(2, '0')}", // عرض الوقت بصيغة MM:SS
                  style: TextStyles.rem20Bold.copyWith(color: Colors.black),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
