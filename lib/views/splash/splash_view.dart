import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab_nerd/core/helper/spacing.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/views/components/background_svg_image.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SplashLogo(),
              verticalSpacing(11),
              ScienceNerdWord(),
              verticalSpacing(7),
              SvgPicture.asset(
                Assets.imagesSvgChemistryForEveryone,
                height: 17.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
