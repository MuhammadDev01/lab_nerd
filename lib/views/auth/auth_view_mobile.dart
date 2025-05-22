import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lab_nerd/views/splash/widgets/science_nerd_word.dart';
import 'widgets/auth_logo_animated.dart';
import 'widgets/background_auth.dart';
import 'auth_view_center_text.dart';
import 'widgets/swipe_up_arrow.dart';
import 'auth_bottom_sheet.dart';

class AuthViewMobile extends StatelessWidget {
  const AuthViewMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BackgroundAuth(
        child: Padding(
          padding: EdgeInsets.only(right: 16, left: 16, top: 16),
          child: Stack(
            children: [
              SafeArea(
                child: Column(
                  children: [
                    AuthLogoAnimated(),
                    SizedBox(
                      height: 20.h,
                    ),
                    ScienceNerdWord(),
                    SizedBox(
                      height: 20.h,
                    ),
                    AuthViewCenterText(),
                    Expanded(child: SwipeUpArrow()),
                  ],
                ),
              ),
              AuthBottomSheet(),
            ],
          ),
        ),
      ),
    );
  }
}
