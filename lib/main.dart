import 'package:flutter/material.dart';
import 'package:flutter_app1/core/di/service_locator.dart';
import 'package:flutter_app1/feature/news/page/home.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        debugShowCheckedModeBanner: true,
        theme: ThemeData(
            appBarTheme: AppBarTheme(color: Colors.white),
            primaryColor: Colors.white,
            scaffoldBackgroundColor: Colors.white),
        home: Home());
  }
}
