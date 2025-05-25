import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/home/quizzes_controller.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/views/home/quizzes/quiz_view.dart';
import 'package:lab_nerd/widgets/constant.dart';
import 'package:lab_nerd/widgets/default_button.dart';

class QuizzesView extends StatelessWidget {
  const QuizzesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.imagesQuizBackground,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GetBuilder<QuizzesController>(
                builder: (controller) => Column(
                  children: [
                    SizedBox(
                      height: 150.h,
                    ),
                    FittedBox(
                      child: Text(
                        'What type of quiz do you prefer?',
                        style:
                            TextStyles.rem26Bold.copyWith(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 200.h,
                    ),
                    DefaultButton(
                      colorButton: Colors.white,
                      onPressed: () => Get.to(
                        () => QuizView(quizType: kSymbols),
                      ),
                      child: Text(
                        "Symbol",
                        style: TextStyles.rem16SemiBold.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    DefaultButton(
                      colorButton: Colors.white,
                      onPressed: () => Get.to(
                        () => QuizView(quizType: kAtomicNumber),
                      ),
                      child: Text(
                        "Atomic Number",
                        style: TextStyles.rem16SemiBold.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    DefaultButton(
                      colorButton: Colors.white,
                      onPressed: () => Get.to(
                        () => QuizView(quizType: kBalanceChemicalEquations),
                      ),
                      child: FittedBox(
                        child: Text(
                          "Balance Chemical Equations",
                          style: TextStyles.rem16SemiBold.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    DefaultButton(
                      colorButton: Colors.white,
                      onPressed: () => Get.to(
                        () => QuizView(quizType: kChemistryReactions),
                      ),
                      child: Text(
                        "Chemistry Reactions",
                        style: TextStyles.rem16SemiBold.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
