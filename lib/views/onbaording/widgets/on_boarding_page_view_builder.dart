import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/controllers/on_boarding_controller.dart';
import 'package:lab_nerd/core/utils/app_get_updates.dart';
import 'package:lab_nerd/core/utils/app_strings.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/models/onboarding_item_model.dart';
import 'package:lab_nerd/views/onbaording/widgets/onboarding_page_builder.dart';

class OnBoardingPageViewBuilder extends StatelessWidget {
  const OnBoardingPageViewBuilder({super.key});
  final List<OnboardingItemModel> onboardingDetailsList = const [
    OnboardingItemModel(
      title: AppStrings.onBoardingTitle1,
      body: AppStrings.onBoardingBody1,
      assetImage: Assets.imagesOnbaording1,
    ),
    OnboardingItemModel(
      title: AppStrings.onBoardingTitle2,
      body: AppStrings.onBoardingBody2,
      assetImage: Assets.imagesOnbaording2,
    ),
    OnboardingItemModel(
      title: AppStrings.onBoardingTitle3,
      body: AppStrings.onBoardingBody3,
      assetImage: Assets.imagesOnbaording3,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      id: AppGetBuilderId.onboardingChangePage,
      builder: (controller) => PageView.builder(
        controller: controller.boardingController,
        onPageChanged: (index) {
          if (index == onboardingDetailsList.length - 1) {
            controller.changePage(true);
          } else {
            controller.changePage(false);
          }
        },
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => OnboardingPageBuilder(
          model: onboardingDetailsList[index],
        ),
        itemCount: onboardingDetailsList.length,
      ),
    );
  }
}
