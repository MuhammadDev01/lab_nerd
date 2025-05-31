import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/controllers/auth/login_controller.dart';
import 'package:lab_nerd/core/utils/assets.dart';
import 'package:lab_nerd/views/auth/signup/tablet_sign_up_view.dart';
import 'package:lab_nerd/views/auth/widgets/auth_animated_logo_with_text.dart';
import 'package:lab_nerd/views/components/background_svg_image.dart';
import 'package:lab_nerd/views/auth/auth_view_center_text.dart';
import 'package:lab_nerd/views/auth/login/tablet_login_view.dart';

class AuthViewTablet extends StatelessWidget {
  const AuthViewTablet({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
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
        body: BackgroundSvgImage(
          image: Assets.imagesSvgAuthBackground,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  AuthAnimatedLogoWithText(),
                  Expanded(
                    child: PageView(
                      onPageChanged: (currentPage) =>
                          controller.onPageChanged(currentPage),
                      controller: controller.pageController,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.1,
                            ),
                            const AuthViewCenterText(
                              blackText: 'Swipe ',
                            ),
                          ],
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
