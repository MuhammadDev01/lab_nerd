import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/constant.dart';
import 'package:lab_nerd/logic/controllers/login_controller.dart';
import 'package:lab_nerd/utils/app_images.dart';
import 'package:lab_nerd/views/home/chat_gpt_view.dart';
import 'package:lab_nerd/views/home/elements_exams_view.dart';
import 'package:lab_nerd/views/home/my_notes_view.dart';
import 'package:lab_nerd/views/home/search_element_view.dart';
import 'package:lab_nerd/widgets/adding_key_widget.dart';

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
      duration:
          const Duration(seconds: 1), // Duration for one cycle of the animation
    )..repeat(
        reverse:
            true); // Repeat the animation indefinitely, reversing direction each time

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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    actions: [
                      AddingKeyWidget(),
                    ],
                  ),
                );
              },
              child: SvgPicture.asset(
                Assets.imagesSvgLab,
                height: 35,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset(
              Assets.imagesSvgNerd,
              height: 35,
              // ignore: deprecated_member_use
              color: Get.isDarkMode ? Colors.white : null,
            ),
            const SizedBox(
              width: 20,
            ),
            const AppBarHome(),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: MediaQuery.sizeOf(context).width > 900 ? 2.2 : 0.8,
          crossAxisCount: 2, // Number of columns
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
                          'assets/images/gpt.png',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Chat GPT',
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
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
                            'assets/images/search in table.png',
                          ),
                          Center(
                            child: AnimatedBuilder(
                              animation: _animationSearch,
                              builder: (context, child) {
                                return Transform.translate(
                                  offset: Offset(
                                      90 * _animationSearch.value - 50, 0),
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
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
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
                          'assets/images/quiz1.png',
                          scale: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Quizzes',
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
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
                          'assets/images/note.png',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'My Notes',
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
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
    );
  }
}

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) => Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SvgPicture.asset(
            Assets.imagesSvgLogowithouteyes,
            width: 70,
            height: 50,
            // ignore: deprecated_member_use
            color: Get.isDarkMode ? Colors.white.withOpacity(0.8) : null,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GetBuilder<LoginController>(
                  builder: (controller) => SvgPicture.asset(
                    'assets/images/svg/${controller.eyesMovation[controller.currentIndexEyes]}',
                    width: 18,
                    height: 18,
                  ),
                ),
                const SizedBox(
                  width: 36,
                ),
                GetBuilder<LoginController>(
                  builder: (controller) => SvgPicture.asset(
                    'assets/images/svg/${controller.eyesMovation[controller.currentIndexEyes]}',
                    width: 18,
                    height: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
