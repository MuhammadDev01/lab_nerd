import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/views/home/widgets/home_view_app_bar.dart';
import 'package:lab_nerd/views/home/widgets/home_view_item.dart';
import 'package:lab_nerd/views/main/widgets/image_backround.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _searchController;
  late Animation<double> _animation;
  late Animation<double> _animationSearch;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    _searchController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 10).animate(_controller);
    _animationSearch =
        CurvedAnimation(parent: _searchController, curve: Curves.linear);
  }

  @override
  void dispose() {
    _controller.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ImageBackround(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              HomeViewAppBar(),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio:
                      MediaQuery.sizeOf(context).width > 900 ? 2.2 : 0.9,
                  crossAxisCount: 2,
                  children: [
                    HomeViewItem(
                      title: 'Chat GPT',
                      onTap: () => Get.toNamed(Routes.chatGptView),
                      animation: _animation,
                      image: Assets.imagesChatGpt,
                    ),
                    HomeViewItem(
                      title: 'Search Element',
                      onTap: () => Get.toNamed(Routes.searchElementView),
                      animation: _animation,
                      child: Stack(
                        children: [
                          Image.asset(
                            Assets.imagesSearchInTable,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Center(
                            child: AnimatedBuilder(
                              animation: _animationSearch,
                              builder: (context, child) {
                                double angle = _animationSearch.value *
                                    2 *
                                    3.141592653589793; // دورة كاملة
                                double radius =
                                    45; // نصف قطر الدائرة اللي هتلف عليها

                                return Transform.translate(
                                  offset: Offset(
                                    radius * cos(angle),
                                    radius * sin(angle),
                                  ),
                                  child: child,
                                );
                              },
                              child: const Icon(
                                Icons.search_rounded,
                                size: 60,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    HomeViewItem(
                      onTap: () => Get.toNamed(Routes.quizesView),
                      animation: _animation,
                      title: 'Quizzes',
                      image: Assets.imagesQuiz,
                    ),
                    HomeViewItem(
                      onTap: () => Get.toNamed(Routes.myNotesView),
                      animation: _animation,
                      title: 'My Notes',
                      image: Assets.imagesMyNote,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
