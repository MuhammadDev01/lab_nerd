import 'package:flutter/material.dart';
import 'package:lab_nerd/views/onbaording/widgets/on_boarding_page_view_builder.dart';
import 'package:lab_nerd/views/onbaording/widgets/onboarding_indicator.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        children: [
          Expanded(child: OnBoardingPageViewBuilder()),
          OnboardingIndicator(),
        ],
      ),
    );
  }
}
