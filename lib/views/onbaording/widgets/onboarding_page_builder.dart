import 'package:flutter/material.dart';
import 'package:lab_nerd/core/utils/themes/text_styles.dart';
import 'package:lab_nerd/models/onboarding_item_model.dart';

class OnboardingPageBuilder extends StatelessWidget {
  const OnboardingPageBuilder({super.key, required this.model});
  final OnboardingItemModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(model.assetImage),
          ),
        ),
        const SizedBox(
          height: 72,
        ),
        FittedBox(
          child: Text(
            model.title,
            style: TextStyles.rem26Bold,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          model.body,
          style: TextStyles.rem16Bold,
        ),
      ],
    );
  }
}
