import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/controllers/home/quizzes_controller.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/main/screens/home/quizzes/quiz_view.dart';
import 'package:lab_nerd/core/utils/constant.dart';

class QuizTypeChoices extends StatelessWidget {
  const QuizTypeChoices({super.key});

  final Map<String, String> quizTypeList = const {
    "Symbol": kSymbols,
    "Atomic Number": kAtomicNumber,
    "Balance Chemical Equations": kBalanceChemicalEquations,
    "Chemistry Reactions": kChemistryReactions,
  };

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizzesController>(
      builder: (controller) => Center(
        child: Column(
          spacing: 30,
          children: quizTypeList.entries.map((type) {
            return ChoiceChip(
              label: Center(
                child: Text(
                  type.key,
                  style: TextStyles.rem16SemiBold.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              showCheckmark: false,
              selected: controller.isUserAnswered,
              backgroundColor: Colors.grey[200],
              padding: EdgeInsets.symmetric(vertical: 15),
              onSelected: (_) => Get.to(() => QuizView(quizType: type.value)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
