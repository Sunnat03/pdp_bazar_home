import 'package:flutter/material.dart';

import '../theme/color.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: lightGrey,
      body: Center(child: Text("Like Page", style: TextStyle(color: black),),),
    );
  }
}