import 'package:flutter/material.dart';
import 'package:flutter_practice/ui/home.dart';
import 'package:flutter_practice/ui/movie_ui/movie_ui.dart';

void main() {
  runApp(MaterialApp(
    home: MovieListView(),
    debugShowCheckedModeBanner: false,
  ));
  // runApp(const MaterialApp(home: QuizApp()));
  // runApp(const MaterialApp(home: BillSplitter()));
  // runApp(const Home());
  // runApp(MaterialApp(
  //   // home: const ScaffoldExample(),
  //   // home: const BizCard(),
  //   home: const Wisdom(),
  //   theme: ThemeData(
  //       textTheme: const TextTheme(
  //         bodyText1: TextStyle(color: Colors.white),
  //         bodyText2: TextStyle(),
  //       ).apply(
  //         bodyColor: Colors.white,
  //         displayColor: Colors.blue,
  //       ),
  //       backgroundColor: Colors.black),
  // ));
}
