import 'package:flutter/material.dart';
import 'package:lab_nerd/core/helper/spacing.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/views/components/background_svg_image.dart';
import 'package:lab_nerd/views/components/chemistrey_for_every_word.dart';
import 'package:lab_nerd/views/components/science_nerd_word.dart';
import 'package:lab_nerd/views/splash/widgets/splash_logo.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BackgroundSvgImage(
        image: Assets.imagesSvgAuthBackground,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 410),
              child: FittedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SplashLogo(),
                    verticalSpacing(10),
                    ScienceNerdWord(),
                    verticalSpacing(5),
                    ChemistreyForEveryWord(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
