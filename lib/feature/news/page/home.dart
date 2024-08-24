import 'package:flutter/material.dart';
import 'package:flutter_app1/core/widget/top_appbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _handleStartBtn() {
    print("aaaaa");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopAppbar(
            firstIcon: Icons.menu,
            firstIconTap: () {},
            secondIcon: Icons.search,
            secondIconTap: () {},
            thirdIcon: Icons.notifications_rounded,
            thirdIconTap: () {},
            iconColor: Colors.black,
            bgColor: Colors.grey),
        body: Text("aaa"));
  }
}
