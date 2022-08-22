import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../pages/home_page.dart';
import '../pages/root_page.dart';

class IntroOne extends StatefulWidget {
  const IntroOne({Key? key}) : super(key: key);

  @override
  State<IntroOne> createState() => _IntroOneState();
}

class _IntroOneState extends State<IntroOne> {
  PageController controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() => isLastPage = index == 2);
            },
            controller: controller,
            children: [
              buildPage(
                  image: "assets/images/image_2022-08-22_14-12-38.png",
                  text: "We provide high quality products just for you"),
              buildPage(
                  image: "assets/images/image_2022-08-22_14-12-52.png",
                  text: "Your satisfaction is our number one priority"),
              buildPage(
                  image: "assets/images/image_2022-08-22_14-13-06.png",
                  text:
                      "Let's fulfill your fashion needs with Shoea right now!"),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const WormEffect(
                      spacing: 16,
                      dotColor: Colors.grey,
                      activeDotColor: Colors.black,
                    ),
                    onDotClicked: (index) => controller.animateToPage(index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn),
                  ),
                ),
                isLastPage
                    ? Container(
                        margin: const EdgeInsets.all(33),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () async {
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setBool("showHome", true);

                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const RootPage()));
                          },
                          color: Colors.black,
                          shape: const StadiumBorder(),
                          child: const Text(
                            "Get Started",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.normal,
                                fontSize: 20),
                          ),
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.all(33),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () => controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut),
                          color: Colors.black,
                          shape: const StadiumBorder(),
                          child: const Text(
                            "Next",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.normal,
                                fontSize: 20),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildPage({
  required String image,
  required String text,
}) =>
    Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 1,
              ),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  text,
                  style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      fontSize: 35),
                ),
              ),
              const SizedBox(
                height: 125,
              ),
              // Container(
              //   margin: const EdgeInsets.all(33),
              //   child: MaterialButton(
              //     minWidth: double.infinity,
              //     height: 60,
              //     onPressed: () {},
              //     color: Colors.black,
              //     shape: const StadiumBorder(),
              //     child: const Text(
              //       "Next",
              //       style: TextStyle(
              //           color: Colors.white,
              //           fontFamily: "Roboto",
              //           fontWeight: FontWeight.normal,
              //           fontSize: 20),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
