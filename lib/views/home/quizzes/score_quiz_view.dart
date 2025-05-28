import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lab_nerd/core/helper/global_helper.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/home/quizzes/widgets/back_home_button.dart';

class ScoreQuizView extends StatelessWidget {
  final int score;

  const ScoreQuizView({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
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
                    fontSize: getResponsiveFontSize(
                        fontSize: GlobalHelper.isTablet ? 40 : 30),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "$score / 10",
                  style: TextStyles.rem26Bold.copyWith(
                    fontSize: getResponsiveFontSize(
                        fontSize: GlobalHelper.isTablet ? 38 : 28),
                  ),
                ),
                SizedBox(height: GlobalHelper.isTablet ? 100.h : 50.h),
                Text(
                  _getResultMessage(),
                  style: TextStyles.rem26Bold.copyWith(
                      fontSize: getResponsiveFontSize(
                          fontSize: GlobalHelper.isTablet ? 30 : 26),
                      fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: GlobalHelper.isTablet ? 100.h : 50.h),
                BackHomeButton(),
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
