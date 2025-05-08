import 'package:flutter/material.dart';
import 'package:lab_nerd/views/auth/login/widgets/background_auth.dart';
import 'package:lab_nerd/views/splash/widgets/nerd_lab_word.dart';
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
