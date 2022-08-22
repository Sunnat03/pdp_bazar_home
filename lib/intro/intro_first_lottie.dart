import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'intro_second_page.dart';

class SplashScreenFirst extends StatelessWidget {
  const SplashScreenFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: ListView(
          children: [
            const Image(
                image: AssetImage(
                    "assets/images/image_2022-08-22_13-58-37.png")),
            Center(
              child: Lottie.asset(
                "assets/lottie/circule.json",
                width: 300,
              ),
            ),
          ],
        ),
        duration: 3000,
        splashIconSize: 700,
        animationDuration: const Duration(seconds: 2),
        nextScreen: const SplashScreenSecond());
  }
}
