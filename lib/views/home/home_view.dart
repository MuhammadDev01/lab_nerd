import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/routes/routes.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/views/home/widgets/home_app_bar.dart';
import 'package:lab_nerd/views/home/widgets/home_item.dart';
import 'package:lab_nerd/views/home/widgets/search_element_item_body.dart';
import 'package:lab_nerd/views/main/widgets/image_backround.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 10).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: Get.isDarkMode
          ? Assets.imagesSvgBackgroundDark
          : Assets.imagesSvgBackgroundLight,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              HomeAppBar(),
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
                    HomeItem(
                      title: 'Chat GPT',
                      onTap: () => Get.toNamed(Routes.chatGptView),
                      animation: _animation,
                      image: Assets.imagesChatGpt,
                    ),
                    HomeItem(
                      title: 'Search Element',
                      onTap: () => Get.toNamed(Routes.searchElementView),
                      animation: _animation,
                      child: SearchElementItemBody(),
                    ),
                    HomeItem(
                      onTap: () => Get.toNamed(Routes.quizesView),
                      animation: _animation,
                      title: 'Quizzes',
                      image: Assets.imagesQuiz,
                    ),
                    HomeItem(
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
