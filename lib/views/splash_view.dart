import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/constant.dart';
import 'package:lab_nerd/helper/cached_helper.dart';
import 'package:lab_nerd/routes/app_router.dart';
import 'package:lab_nerd/utils/app_images.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  int _currentIndex = 0;
  final int eyeSize = 50;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _navigateToWelcome();
    if (mounted) {
      _moveEyes();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SvgPicture.asset(
            width: double.infinity,
            height: double.infinity,
            Assets.imagesSvgAuthBackground,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    SvgPicture.asset(
                      Assets.imagesSvgLogowithouteyes,
                      height: 135,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/svg/${splashEyes[_currentIndex]}',
                            height: eyeSize.h,
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          SvgPicture.asset(
                            'assets/images/svg/${splashEyes[_currentIndex]}',
                            height: eyeSize.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.imagesSvgLab),
                    const SizedBox(
                      width: 12,
                    ),
                    SvgPicture.asset(Assets.imagesSvgNerd),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SvgPicture.asset(Assets.imagesSvgChemistryforeveryone),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _moveEyes() {
    _timer = Timer.periodic(const Duration(milliseconds: 150), (Timer timer) {
      setState(() {
        if (_currentIndex < splashEyes.length - 1) {
          _currentIndex++;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  void _navigateToWelcome() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (CachedHelper.getData(key: kOnBoarding) == null) {
        Get.offNamed(Routes.onBoardingView);
      } else {
        if (CachedHelper.getData(key: kOnLogging) == null) {
          Get.offNamed(Routes.loginView);
        } else {
          Get.offNamed(Routes.homeView);
        }
      }
    });
  }
}
