import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/home/quizzes_controller.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/exam/widgets/full_mark_score_view.dart';
import 'package:lab_nerd/views/exam/widgets/normal_score.dart';
import 'package:lab_nerd/views/home/quizzes/widgets/back_home_button.dart';

class ExamScoreView extends StatefulWidget {
  const ExamScoreView({super.key});

  @override
  State<ExamScoreView> createState() => _ExamScoreViewState();
}

class _ExamScoreViewState extends State<ExamScoreView> {
  late ConfettiController _confettiController;
  late String percentage;
  final QuizzesController controller = Get.find();
  @override
  void initState() {
    percentage = (controller.score / 50 * 100).toStringAsFixed(0);
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 5));
    if (percentage == '100') _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          if (percentage == '100')
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              emissionFrequency: 0.05,
              numberOfParticles: 25,
              gravity: 0.2,
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Score Exam',
                style: TextStyles.rem26Bold.copyWith(
                  letterSpacing: 3,
                  fontSize: getResponsiveFontSize(fontSize: 40),
                ),
              ),
              percentage == '100'
                  ? FullMarkScoreView()
                  : NormalScoreView(percentage: int.parse(percentage)),
              BackHomeButton(),
            ],
          ),
        ],
      ),
    );
  }
}
