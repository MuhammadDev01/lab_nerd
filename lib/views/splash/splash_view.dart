import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_nerd/logic/controllers/splash_controller.dart';
import 'package:lab_nerd/views/auth/auth/background_auth.dart';
import 'package:lab_nerd/views/splash/widgets/nerd_lab_word.dart';
import 'package:lab_nerd/views/splash/widgets/splash_logo.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final _controller = Get.find<SplashController>();
  @override
  void initState() {
    _controller.moveEyes();
    _controller.navigateToWelcome();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              const SizedBox(
                height: 20,
              ),
              const NerdLabWord(),
            ],
          ),
        ),
      ),
    );
  }
}
