import 'package:flutter/material.dart';
import 'package:flutter_app1/Views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home: Home()
    );
  }
}