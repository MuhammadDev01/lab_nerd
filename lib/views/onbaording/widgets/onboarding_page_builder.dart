import 'package:flutter/material.dart';
import 'package:lab_nerd/core/themes/text_styles.dart';
import 'package:lab_nerd/models/onboarding_item_model.dart';

class OnboardingPageBuilder extends StatelessWidget {
  const OnboardingPageBuilder({super.key, required this.model});
  final OnboardingItemModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(model.assetImage),
          ),
          FittedBox(
            child: Text(
              model.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            model.body,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
