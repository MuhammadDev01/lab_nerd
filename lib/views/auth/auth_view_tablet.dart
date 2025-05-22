import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/core/logic/controllers/auth/login_controller.dart';
import 'package:lab_nerd/views/auth/signup/tablet_sign_up_view.dart';
import 'package:lab_nerd/views/auth/widgets/auth_animated_logo_with_text.dart';
import 'package:lab_nerd/views/auth/widgets/background_auth.dart';
import 'package:lab_nerd/views/auth/auth_view_center_text.dart';
import 'package:lab_nerd/views/auth/login/tablet_login_view.dart';

class AuthViewTablet extends StatelessWidget {
  const AuthViewTablet({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      id: 'login_or_sign_up',
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: controller.currentPage.value == 1
            ? null
            : FloatingActionButton(
                onPressed: () => controller.goToSecondPageView(),
                backgroundColor: Colors.blue[400],
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
        body: BackgroundAuth(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  AuthAnimatedLogoWithText(),
                  Expanded(
                    flex: 3,
                    child: PageView(
                      onPageChanged: (currentPage) =>
                          controller.onPageChanged(currentPage),
                      controller: controller.pageController,
                      children: [
                        const AuthViewCenterText(
                          blackText: 'Swipe ',
                        ),
                        controller.isLogin
                            ? TabletLoginView()
                            : TabletSignUpView(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
