import 'package:flutter/material.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/main/screens/home/quizzes/widgets/quiz_type_choices.dart';

class QuizzesViewBody extends StatelessWidget {
  const QuizzesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: MediaQuery.sizeOf(context).height * 0.3,
          child: FittedBox(
            child: Text(
              'What type of quiz do you prefer?',
              style: TextStyles.rem26Bold.copyWith(color: Colors.white),
            ),
          ),
        ),
        QuizTypeChoices(),
      ],
    );
  }
}
