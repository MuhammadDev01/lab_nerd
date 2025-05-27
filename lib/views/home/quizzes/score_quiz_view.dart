import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/themes/colors_manager.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/widgets/custom_app_button.dart';

class ScoreQuizView extends StatelessWidget {
  final int score;

  const ScoreQuizView({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.sizeOf(context).width > 600;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Quiz Result',
          style: TextStyles.slacksideOnes30Bold,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          color: Colors.blueAccent,
          elevation: 5,
          margin: const EdgeInsets.all(20.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Your Score",
                  style: TextStyles.rem26Bold.copyWith(
                    fontSize:
                        getResponsiveFontSize(fontSize: isTablet ? 40 : 30),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "$score / 10",
                  style: TextStyles.rem26Bold.copyWith(
                    fontSize:
                        getResponsiveFontSize(fontSize: isTablet ? 38 : 28),
                  ),
                ),
                SizedBox(height: isTablet ? 100.h : 50.h),
                Text(
                  _getResultMessage(),
                  style: TextStyles.rem26Bold.copyWith(
                      fontSize:
                          getResponsiveFontSize(fontSize: isTablet ? 30 : 26),
                      fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: isTablet ? 100.h : 50.h),
                CustomAppButton(
                  onPressed: () => Get.offNamed(Routes.mainView),
                  colorButton: ColorsManager.greenWhite,
                  width: isTablet ? 150.w : 100.w,
                  height: isTablet ? 100.h : 50.h,
                  child: Text(
                    "Back Home",
                    style: TextStyles.rem26Bold.copyWith(
                      fontSize:
                          getResponsiveFontSize(fontSize: isTablet ? 30 : 24),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getResultMessage() {
    if (score / 10 >= 0.8) {
      return "Excellent! You did a great job!😀🔥";
    } else if (score / 10 >= 0.5) {
      return "Good! You can improve your level even more!😉🩵";
    } else {
      return "No problem, try again and be more precise!🥲❤️";
    }
  }
}
