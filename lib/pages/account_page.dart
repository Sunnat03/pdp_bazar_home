import 'package:flutter/material.dart';

import '../theme/color.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: lightGrey,
      body: Center(child: Text("Profile Page", style: TextStyle(color: black),),),
    );
  }
}