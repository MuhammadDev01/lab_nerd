import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/constant.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/views/home/chat_gpt/chat_gpt_view.dart';
import 'package:lab_nerd/views/exams/elements_exams_view.dart';
import 'package:lab_nerd/views/home/my_notes/my_notes_view.dart';
import 'package:lab_nerd/views/home/search_elements/search_element_view.dart';
import 'package:lab_nerd/views/home/widgets/home_view_app_bar.dart';
import 'package:lab_nerd/views/main/widgets/image_backround.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animationSearch;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 10).animate(_controller);
    _animationSearch = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();

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
                child: Center(
                  child: GridView.count(
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio:
                        MediaQuery.sizeOf(context).width > 900 ? 2.2 : 0.8,
                    crossAxisCount: 2,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(ChatGptView(), transition: Transition.zoom);
                        },
                        child: Card(
                          color: Colors.white70,
                          elevation: 25,
                          child: Column(
                            children: [
                              Expanded(
                                child: AnimatedBuilder(
                                  animation: _animation,
                                  builder: (context, child) {
                                    return Transform.translate(
                                      offset: Offset(0, _animation.value),
                                      child: child,
                                    );
                                  },
                                  child: Image.asset(
                                    Assets.imagesChatGpt,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  'Chat GPT',
                                  textAlign: TextAlign.center,
                                  // style:
                                  //     Theme.of(context).textTheme.displaySmall!.copyWith(
                                  //           fontFamily: fontSlacksideOne,
                                  //           color: Colors.black,
                                  //         ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const SearchElementView(),
                              transition: Transition.fadeIn);
                        },
                        child: Card(
                          color: Colors.white70,
                          elevation: 25,
                          child: Column(
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      Assets.imagesSearchInTable,
                                    ),
                                    Center(
                                      child: AnimatedBuilder(
                                        animation: _animationSearch,
                                        builder: (context, child) {
                                          return Transform.translate(
                                            offset: Offset(
                                                90 * _animationSearch.value -
                                                    50,
                                                0),
                                            child: child,
                                          );
                                        },
                                        child: const Icon(
                                          Icons.search_rounded,
                                          size: 80,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  'Search Element',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                        fontFamily: fontSlacksideOne,
                                        color: Colors.black,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const ElementsExamsView(),
                              transition: Transition.fadeIn);
                        },
                        child: Card(
                          color: Colors.white70,
                          elevation: 25,
                          child: Column(
                            children: [
                              Expanded(
                                child: AnimatedBuilder(
                                  animation: _animation,
                                  builder: (context, child) {
                                    return Transform.translate(
                                      offset: Offset(0, _animation.value),
                                      child: child,
                                    );
                                  },
                                  child: Image.asset(
                                    Assets.imagesQuiz,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Quizzes',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                        fontFamily: fontSlacksideOne,
                                        color: Colors.black,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const MyNotesView(),
                              transition: Transition.fadeIn);
                        },
                        child: Card(
                          color: Colors.white70,
                          elevation: 25,
                          child: Column(
                            children: [
                              Expanded(
                                child: AnimatedBuilder(
                                  animation: _animation,
                                  builder: (context, child) {
                                    return Transform.translate(
                                      offset: Offset(0, _animation.value),
                                      child: child,
                                    );
                                  },
                                  child: Image.asset(
                                    Assets.imagesAddNote,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'My Notes',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                        fontFamily: fontSlacksideOne,
                                        color: Colors.black,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
