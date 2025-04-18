import 'package:flutter/material.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/models/onboarding_item_model.dart';
import 'package:lab_nerd/views/onbaording/widgets/onboarding_appbar.dart';
import 'package:lab_nerd/views/onbaording/widgets/onboarding_indicator_and_floating_action_button.dart';
import 'package:lab_nerd/views/onbaording/widgets/onboarding_page_builder.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});
  final List<OnboardingItemModel> onboardingDetailsList = const [
    OnboardingItemModel(
      title: 'Unique and safe experience',
      body:
          'Lab Nerd provides a special experience for students where interactions can be done easily and completely safely',
      assetImage: Assets.imagesOnbaording1,
    ),
    OnboardingItemModel(
      title: 'Learn everything at home',
      body:
          'The student can study the periodic table and apply what he has learned with ease and take important notes',
      assetImage: Assets.imagesOnbaording2,
    ),
    OnboardingItemModel(
      title: 'Quizes on what you want',
      body:
          'Many quizzes on what have studied specifically,as there are Exams for the preparatory stage',
      assetImage: Assets.imagesOnbaording3,
    )
  ];

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final _boardingController = PageController();

  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: OnboardingAppbar(),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _boardingController,
                  onPageChanged: (index) {
                    if (index == widget.onboardingDetailsList.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => OnboardingPageBuilder(
                    model: widget.onboardingDetailsList[index],
                  ),
                  itemCount: 3,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              OnboardingIndicatorAndFloatingActionButton(
                boardingController: _boardingController,
                onboardingDetailsList: widget.onboardingDetailsList,
                isLast: isLast,
              ),
            ],
          ),
        ));
  }
}
