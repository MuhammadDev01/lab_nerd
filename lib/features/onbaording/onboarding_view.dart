import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/constant.dart';
import 'package:lab_nerd/core/helper/cached_helper.dart';
import 'package:lab_nerd/views/auth/login/login_view_builder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingItemModel {
  final String title;
  final String body;
  final Image image;

  const OnboardingItemModel({
    required this.title,
    required this.body,
    required this.image,
  });
}

class OnboardingView extends StatefulWidget {
  OnboardingView({super.key});
  final List<OnboardingItemModel> boardingList = [
    OnboardingItemModel(
      title: 'Unique and safe experience',
      body:
          'Lab Nerd provides a special experience for students where interactions can be done easily and completely safely',
      image: Image.asset('assets/images/beaker chemistry.gif'),
    ),
    OnboardingItemModel(
      title: 'Learn everything at home',
      body:
          'The student can study the periodic table and apply what he has learned with ease and take important notes',
      image: Image.asset('assets/images/Online learning.gif'),
    ),
    OnboardingItemModel(
      title: 'Quizes on what you want',
      body:
          'Many quizzes on what have studied specifically,as there are Exams for the preparatory stage',
      image: Image.asset('assets/images/Customer Survey.gif'),
    ),
  ];

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final boardingController = PageController();

  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                CachedHelper.saveData(key: kOnBoarding, value: true)
                    .then((value) {
                  if (value) {
                    Get.off(
                      () => const LoginViewBuilder(),
                      transition: Transition.zoom,
                      curve: Curves.bounceInOut,
                      duration: const Duration(milliseconds: 500),
                    );
                  }
                });
              },
              child: const Text(
                'SKIP',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: boardingController,
                  onPageChanged: (index) {
                    if (index == widget.boardingList.length - 1) {
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
                  itemBuilder: (context, index) => boardingBuildItem(
                    model: widget.boardingList[index],
                  ),
                  itemCount: 3,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: boardingController,
                    count: widget.boardingList.length,
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
                        CachedHelper.saveData(key: kOnBoarding, value: true)
                            .then((value) {
                          if (value) {
                            Get.off(
                              () => const LoginViewBuilder(),
                              transition: Transition.zoom,
                              curve: Curves.bounceInOut,
                              duration: const Duration(milliseconds: 500),
                            );
                          }
                        });
                      } else {
                        boardingController.nextPage(
                          duration: const Duration(
                            milliseconds: 600,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

Widget boardingBuildItem({
  required OnboardingItemModel model,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: model.image,
          //scale: 1,
        ),
        const SizedBox(
          height: 72,
        ),
        FittedBox(
          child: Text(
            model.title,
            style: const TextStyle(
              fontSize: 26,
              fontFamily: 'REM',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          model.body,
          style: const TextStyle(
            fontSize: 15,
            fontFamily: 'REM',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
