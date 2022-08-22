import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdp_bazar_home/pages/account_page.dart';
import 'package:pdp_bazar_home/pages/home_page.dart';
import 'package:pdp_bazar_home/pages/my_shopping_page.dart';
import 'package:pdp_bazar_home/pages/wishlist_page.dart';
import 'package:pdp_bazar_home/theme/color.dart';
import 'package:pdp_bazar_home/util/constant.dart';
import 'package:pdp_bazar_home/util/drawer_json.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  bool isNotify = true;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: lightGrey,
      key: _drawerKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  splashRadius: 25,
                  onPressed: () {
                    _drawerKey.currentState?.openDrawer();
                  },
                  icon: SvgPicture.asset("assets/images/menu.svg", height: 24),
                ),
                Row(
                  children: [
                    IconButton(
                      splashRadius: 25,
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.search,color: Colors.white,size: 20),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: NetworkImage(profileUrl),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: getDrawer(),
      body: getBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: getBottomNavigationBar(size),
    );
  }


  Widget getDrawer() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  splashRadius: 15,
                  iconSize: 20,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(30),
                margin: const EdgeInsets.only(bottom: 60),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(profileUrl),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
              ),
              Column(
                children: List.generate(drawerMenus.length, (index) {
                  return SlideInLeft(
                    duration: Duration(milliseconds: drawerMenus[index]['duration']),
                    child: ListTile(
                      onTap: () {},
                      title: Row(
                        children: [
                          SvgPicture.asset(drawerMenus[index]['imageUrl'], height: 20,),
                          const SizedBox(width: 15),
                          Text(drawerMenus[index]['name'])
                        ],
                      ),
                      trailing: drawerMenus[index]['isAction']
                      ? Switch(
                        value: isNotify,
                        onChanged: (value) {
                          setState(() {
                            isNotify = value;
                          });
                        },
                      )
                      : null
                    ),
                  );
                }),
              ),
              Expanded(
                child: SlideInLeft(
                  duration: const Duration(milliseconds: 750),
                  child: Container(
                    alignment: FractionalOffset.bottomCenter,
                    child: ListTile(
                      title: Row(
                        children: const [
                          Icon(Icons.logout, color: blue,),
                          SizedBox(width: 10),
                          Text("Logout", style: TextStyle(color: blue),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: selectedIndex,
      children: const [
        HomePage(),
        MyShoppingPage(),
        WishlistPage(),
        AccountPage(),
      ],
    );
  }

  Widget getBottomNavigationBar(size) {
    return SizedBox(
      height: 75,
      width: size.width,
      child: BottomAppBar(
        elevation: 0.0,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width: 20,),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    icon: selectedIndex == 0
                    ? ElasticIn(child: SvgPicture.asset("assets/images/home_active.svg", height: 23))
                    : SvgPicture.asset("assets/images/home_inactive.svg", height: 23),

                  ),
                  const SizedBox(width: 25,),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    icon: selectedIndex == 1
                    ? ElasticIn(child: SvgPicture.asset("assets/images/cart_active.svg", height: 23))
                    : SvgPicture.asset("assets/images/cart_inactive.svg", height: 23),
                  ),
                  const SizedBox(width: 25,),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    icon: selectedIndex == 1
                    ? ElasticIn(child: const Icon(CupertinoIcons.shopping_cart,color: Colors.black,size: 23,))
                    : const Icon(CupertinoIcons.shopping_cart,color: Colors.black,size: 23,),
                  ),
                  const SizedBox(width: 25,),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    icon: selectedIndex == 2
                        ? ElasticIn(child: SvgPicture.asset("assets/images/heart_active.svg", height: 23))
                        : SvgPicture.asset("assets/images/heart_inactive.svg", height: 23),
                  ),
                  const SizedBox(width: 25,),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                    icon: selectedIndex == 3
                        ? ElasticIn(child: SvgPicture.asset("assets/images/user_active.svg", height: 23))
                        : SvgPicture.asset("assets/images/user_inactive.svg", height: 23),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
