import 'package:flutter/material.dart';
import 'package:flutter_practice/ui/home.dart';

void main() {
  // runApp(const Home());
  runApp(MaterialApp(
    // home: const ScaffoldExample(),
    home: const BizCard(),
    theme: ThemeData(
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.blue,
        ),
        backgroundColor: Colors.black),
  ));
}
