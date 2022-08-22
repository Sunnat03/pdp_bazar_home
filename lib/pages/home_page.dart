import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:pdp_bazar_home/theme/color.dart';
import 'package:pdp_bazar_home/util/home_page_json.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: lightGrey,
      body: getBody(size),
    );
  }

  Widget getBody(size) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 240,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: NetworkImage(banner),
                fit: BoxFit.cover
              )
            ),
          ),
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "New Arrival",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),
              Text(
                "See All",
                style: TextStyle(
                  fontSize: 13,
                  color: grey
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:Row(
            children: [
              const SizedBox( width: 20,),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(80),
                    ),
                 child: const Image(image:  AssetImage("assets/logo/Logo_NIKE.svg.png",),
                  ),),
                  const SizedBox(height: 7,),
                  const Text("Nike",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
                  const SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(80),
                    ),
                 child: const Image(image:  AssetImage("assets/logo/Reebok_logo20.png",),
                  ),),
                  const SizedBox(height: 7),
                  const Text("Reebok",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),)

                ],
              ),
              const SizedBox( width: 40,),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(80),
                    ),
                 child: const Image(image:  AssetImage("assets/logo/Adidas_isologo.svg.png",),
                  ),),
                  const SizedBox(height: 7,),
                  const Text("Adidas",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
                  const SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(80),
                    ),
                 child: const Image(image:  AssetImage("assets/logo/pngwing.com.png",),
                  ),),
                  const SizedBox(height: 7),
                  const Text("New Ba..",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),)

                ],
              ),
              const SizedBox( width: 40,),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(80),
                    ),
                 child: const Image(image:  AssetImage("assets/logo/pngegg (1).png",),
                  ),),
                  const SizedBox(height: 7,),
                  const Text("Puma",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
                  const SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(80),
                    ),
                 child: const Image(image:  AssetImage("assets/logo/converse-logo-48DE5ADC12-seeklogo.com.png",),
                  ),),
                  const SizedBox(height: 7),
                  const Text("Converse",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),)

                ],
              ),
              const SizedBox( width: 40,),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(80),
                    ),
                 child: const Image(image:  AssetImage("assets/logo/pngegg (2).png",),
                  ),),
                  const SizedBox(height: 7,),
                  const Text("Asics",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
                  const SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(80),
                    ),
                 child: const Image(image:  AssetImage("assets/logo/clipart2012828.png",),
                  ),),
                  const SizedBox(height: 7),
                  const Text("More ..",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),)

                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Most Popular",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),
              Text(
                "See All",
                style: TextStyle(
                  fontSize: 13,
                  color: grey
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                height: 15,
                width: 30,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ) ,
                child: const Text("All",style: TextStyle(fontSize: 15),),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                      ),
                      child: const Image(
                        image: AssetImage("assets/images/d662c4045ab1e10d015b4a0a00.jpeg"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const Text("K-Swiss",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    const Text("85",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    const SizedBox(height: 10),
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                      ),
                      child: const Image(
                        image: AssetImage("assets/images/Без названия.jpg"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const Text("RS-X",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    const Text("110",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    const SizedBox(height: 10),
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: const Image(
                        image: AssetImage("assets/images/images.jpg"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const Text("Nike Smart",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    const Text("150",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),

                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                      ),
                      child: const Image(
                        image: AssetImage("assets/images/images2.jpg"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const Text("Air-Force",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    const Text("125",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    const SizedBox(height: 10),
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                      ),
                      child: const Image(
                        image: AssetImage("assets/images/Без названия5.jpg"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const Text("Nike-Air",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    const Text("95",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    const SizedBox(height: 10),
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: const Image(
                        image: AssetImage("assets/images/ghjkjl;l.jpg"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const Text("Nike Air-Max",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    const Text("105",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),

                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}