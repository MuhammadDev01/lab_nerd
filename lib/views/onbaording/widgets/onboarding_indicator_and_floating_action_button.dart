import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/constant.dart';
import 'package:lab_nerd/core/helper/cached_helper.dart';
import 'package:lab_nerd/models/onboarding_item_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../auth/login/login_view_builder.dart';

class OnboardingIndicatorAndFloatingActionButton extends StatelessWidget {
  const OnboardingIndicatorAndFloatingActionButton({
    super.key,
    required this.boardingController,
    required this.onboardingDetailsList,
    required this.isLast,
  });

  final PageController boardingController;
  final List<OnboardingItemModel> onboardingDetailsList;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SmoothPageIndicator(
          controller: boardingController,
          count: onboardingDetailsList.length,
          effect: const ExpandingDotsEffect(
            dotColor: Colors.grey,
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: Colors.blue,
            spacing: 5,
            expansionFactor: 4,
          ),
        ),
        const Spacer(),
        FloatingActionButton(
          backgroundColor: Colors.blue[400],
          foregroundColor: Colors.white,
          onPressed: () {
            if (isLast) {
              _saveInCacheAndGoToLogin();
            } else {
              _goToNextPage();
            }
          },
          child: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }

  void _goToNextPage() {
    boardingController.nextPage(
      duration: const Duration(
        milliseconds: 600,
      ),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  void _saveInCacheAndGoToLogin() {
    CachedHelper.saveData(key: kOnBoarding, value: true).then((value) {
      if (value) {
        Get.off(
          () => const LoginViewBuilder(),
          transition: Transition.zoom,
          duration: const Duration(milliseconds: 500),
        );
      }
    });
  }
}
