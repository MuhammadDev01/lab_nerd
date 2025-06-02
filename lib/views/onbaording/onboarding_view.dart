import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/controllers/on_boarding_controller.dart';
import 'package:lab_nerd/views/onbaording/widgets/onboarding_appbar.dart';
import 'package:lab_nerd/views/onbaording/widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});
  final OnBoardingController controller = Get.put(OnBoardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OnboardingAppbar(),
      body: OnboardingViewBody(),
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: Colors.blue[400],
        foregroundColor: Colors.white,
        onPressed: () => controller.onPressedFloatingActionButton(),
        child: const Icon(
          Icons.arrow_forward_ios,
          size: 20,
        ),
      ),
    );
  }
}
