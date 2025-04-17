import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/logic/controllers/login_controller.dart';
import 'package:lab_nerd/views/auth/auth/animated_logo.dart';
import 'package:lab_nerd/views/auth/auth/background_auth.dart';
import 'package:lab_nerd/views/auth/auth/center_login_text.dart';
import 'package:lab_nerd/views/auth/auth/login_fields_tablet.dart';

class LoginViewTablet extends StatefulWidget {
  const LoginViewTablet({super.key});

  @override
  State<LoginViewTablet> createState() => _LoginViewTabletState();
}

class _LoginViewTabletState extends State<LoginViewTablet> {
  int index = 0;
  final PageController _pageController = PageController();

  final loginController = Get.find<LoginController>();

  @override
  void initState() {
    loginController.moveEyes();
    super.initState();
  }

  @override
  void dispose() {
    loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: index == 1
          ? null
          : FloatingActionButton(
              backgroundColor: Colors.black54,
              onPressed: () {
                setState(() {
                  _pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                  );
                  index = 1;
                });
              },
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
      body: BackgroundAuth(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const AnimatedLogo(),
              Expanded(
                flex: 3,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.05,
                        ),
                        const CenterLoginText(
                          blackText: 'Swipe ',
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.2,
                        ),
                      ],
                    ),
                    const LoginFieldsTablet(),
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
