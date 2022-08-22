import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'intro_third.dart';

class SplashScreenSecond extends StatelessWidget {
  const SplashScreenSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/9-500-corsac-black-original-imagbyzezm5vkhyf-bb.webp"),
              fit: BoxFit.cover,
            ),
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.blue,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "Welcome  to  👋",
                style: TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
              ),
            ),
            SizedBox(height: 25,),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "SHoea",
                style: TextStyle(
                  fontSize: 70,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "The best dafvjqefvjnq qejnvqiejv",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
              ),
            ),
            SizedBox(height: 100,),
          ],
        ),
      ),
      splashIconSize: 1000,
      duration: 5000,
      nextScreen: const IntroOne(),
    );
  }
}
