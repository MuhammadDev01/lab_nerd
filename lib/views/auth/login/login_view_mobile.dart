import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/logic/controllers/login_controller.dart';
import '../auth/animated_logo.dart';
import '../auth/background_auth.dart';
import '../auth/center_login_text.dart';
import '../../../../widgets/shimer_arrows.dart';
import '../auth/mobile_show_login_bottom_sheet.dart';

class LoginViewMobile extends StatefulWidget {
  const LoginViewMobile({
    super.key,
  });

  @override
  State<LoginViewMobile> createState() => _LoginViewMobileState();
}

class _LoginViewMobileState extends State<LoginViewMobile> {
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
      resizeToAvoidBottomInset: false,
      body: BackgroundAuth(
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 16.h),
          child: Stack(
            children: [
              Column(
                children: [
                  AnimatedLogo(),
                  Expanded(
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CenterLoginText(),
                            ShimmerArrows(),
                          ],
                        ),
                        ShowLoginBottomSheet(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
