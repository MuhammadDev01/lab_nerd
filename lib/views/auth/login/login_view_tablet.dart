import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/auth/login_controller.dart';
import 'package:lab_nerd/views/auth/widgets/logo_of_auth.dart';
import 'package:lab_nerd/views/auth/widgets/background_auth.dart';
import 'package:lab_nerd/views/auth/login/widgets/center_login_text.dart';
import 'package:lab_nerd/views/auth/login/widgets/login_fields_tablet.dart';
import 'package:lab_nerd/views/auth/login/widgets/floating_action_button_login_tablet.dart';
import 'package:lab_nerd/views/splash/widgets/science_nerd_word.dart';

class LoginViewTablet extends StatelessWidget {
  const LoginViewTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: controller.currentPageIndex.value == 1
            ? null
            : FloatingActionButtonLoginTablet(),
        body: BackgroundAuth(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LogoOfAuth(),
                const SizedBox(
                  height: 20,
                ),
                const ScienceNerdWord(),
                Expanded(
                  flex: 3,
                  child: PageView(
                    controller: controller.pageController,
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
      ),
    );
  }
}
