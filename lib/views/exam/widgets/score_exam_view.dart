import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/views/exam/widgets/congratulations_view.dart';
import 'package:lab_nerd/views/exam/widgets/normal_score.dart';

class ScoreExamView extends StatefulWidget {
  final int score;

  const ScoreExamView({super.key, required this.score});

  @override
  State<ScoreExamView> createState() => _ScoreExamViewState();
}

class _ScoreExamViewState extends State<ScoreExamView> {
  late ConfettiController _confettiController;
  late String percentage;
  @override
  void initState() {
    percentage = (widget.score / 50 * 100).toStringAsFixed(0);
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
                ),
              ),
              percentage == '100'
                  ? CongratulationsView(percentage: percentage)
                  : NormalScoreView(percentage: int.parse(percentage)),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => Get.offNamed(Routes.mainView),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text(
                  "Back to Home",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
