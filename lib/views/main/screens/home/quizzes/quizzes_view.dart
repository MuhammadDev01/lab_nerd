import 'package:flutter/material.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/views/main/screens/home/quizzes/quizzes_view_body.dart';

class QuizzesView extends StatelessWidget {
  const QuizzesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            Assets.imagesQuizBackground,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
              child: Padding(
            padding: EdgeInsets.all(16),
            child: QuizzesViewBody(),
          )),
        ],
      ),
    );
  }
}
