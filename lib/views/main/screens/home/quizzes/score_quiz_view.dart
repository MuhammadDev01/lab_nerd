import 'package:flutter/material.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/main/screens/home/quizzes/widgets/back_home_button.dart';

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
                ),
                SizedBox(height: 10),
                Text(
                  "$score / 10",
                  style: TextStyles.rem26Bold.copyWith(),
                ),
                //SizedBox(height: GlobalHelper.isTablet ? 100.h : 50.h),
                Text(
                  _getResultMessage(),
                  style: TextStyles.rem26Bold.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                //   SizedBox(height: GlobalHelper.isTablet ? 100.h : 50.h),
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
