import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/widgets/default_button.dart';

class ScoreQuizView extends StatelessWidget {
  const ScoreQuizView({super.key, required this.score});
  final int score;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.imagesQuizViewBackround,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200.h,
                ),
                Text(
                  'Your Score : ${score * 10}%',
                  style: TextStyles.slacksideOnes30Bold
                      .copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: 100.h,
                ),
                DefaultButton(
                  onPressed: () => Get.offNamed(Routes.mainView),
                  colorButton: Colors.white,
                  child: Text(
                    'Back to Home',
                    style: TextStyles.rem20Boldd.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
