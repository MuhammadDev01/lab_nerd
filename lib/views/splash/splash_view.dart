import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lab_nerd/views/auth/widgets/background_auth.dart';
import 'package:lab_nerd/views/splash/widgets/science_nerd_word.dart';
import 'package:lab_nerd/views/splash/widgets/splash_logo.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BackgroundAuth(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SplashLogo(),
              SizedBox(
                height: 20.h,
              ),
              const ScienceNerdWord(),
            ],
          ),
        ),
      ),
    );
  }
}
