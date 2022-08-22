import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../theme/color.dart';
import '../util/detail_json.dart';

class DetailPage extends StatefulWidget {
  static const String id = "/detail_page";
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int activeIndex = 0;
  int selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: lightGrey,
      appBar:  AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: black,),
        ),
        actions: [
          IconButton(
            splashRadius: 25,
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline, color: black,),
          ),
          IconButton(
            splashRadius: 25,
            onPressed: () {},
            icon: const Icon(Icons.share_outlined, color: black,),
          ),
        ],
      ),
      body: getBody(size),
    );
  }



  Widget getBody(size) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Stack(
            children: [
              SizedBox(
                width: size.width,
                child: CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 16/10,
                    viewportFraction: 1.0,
                    autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  ),
                  items: List.generate(images.length, (index) {
                    return Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(images[index]),
                          fit: BoxFit.cover
                        )
                      ),
                      child: Container(
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: black.withOpacity(0.1)
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Positioned(
                top: 0,
                left: 15,
                bottom: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(colors.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colors[index]
                        ),
                      ),
                    );
                  }),
                )
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(images.length, (index) {
                    return activeIndex == index
                    ? Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        height: 4,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: blue
                        ),
                      ),
                    )
                    : Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        height: 4,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: grey
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Nike Sneaker Shoes",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    "\$25",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "(20)",
                    style: TextStyle(
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(width: 5,),
                  RatingBarIndicator(
                    rating: 5,
                    itemCount: 5,
                    itemSize: 12.0,
                    direction: Axis.horizontal,
                    itemBuilder: (context, index) => const Icon(Icons.star, color: Colors.amber,),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              const Text(
                "Size",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                )
              )
            ],
          ),
        ),
        const SizedBox(height: 20,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(sizes.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 15 : 10,
                  right: index == (sizes.length - 1) ? 15 : 0
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    setState(() {
                      selectedSize = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: white.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3)
                        )
                      ],
                      color: selectedSize == index ? blue : white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 28),
                      child: selectedSize == index 
                      ? ElasticIn(
                        child: Text(
                          sizes[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: white
                          ),
                        ),
                      )
                      : Text(
                        sizes[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Description",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down_rounded, color: grey, size: 30,)
                ],
              ),
              const SizedBox(height: 20,),
              const Text(
                description,
                style: TextStyle(
                  color: grey,
                  height: 1.3
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40,),
        Center(
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () {},
            child: SizedBox(
              height: 45,
              width: size.width * 0.35,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: black
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.shopping_bag_outlined, color: white),
                    SizedBox(width: 5,),
                    Text(
                      "Checkout",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: white
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 50,),
      ],
    );
  }
}