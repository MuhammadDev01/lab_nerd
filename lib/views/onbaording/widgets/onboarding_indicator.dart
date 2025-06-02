import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/controllers/on_boarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingIndicator extends StatelessWidget {
  const OnboardingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: Get.find<OnBoardingController>().boardingController,
      count: 3,
      effect: const ExpandingDotsEffect(
        dotColor: Colors.grey,
        dotHeight: 10,
        dotWidth: 10,
        activeDotColor: Colors.blue,
        spacing: 5,
        expansionFactor: 4,
      ),
    );
  }
}
