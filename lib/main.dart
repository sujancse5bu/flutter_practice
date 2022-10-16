import 'package:flutter/material.dart';
import 'package:flutter_practice/ui/home.dart';
import 'package:flutter_practice/ui/movie_ui/movie_ui.dart';

final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
      brightness: Brightness.dark,
      accentColor: Colors.amber,
      primaryColor: Colors.green,
      backgroundColor: Colors.amber,
      scaffoldBackgroundColor: Colors.red,
      textTheme: _appTextTheme(base.textTheme)

      // colorScheme: ColorScheme(
      //   primary: Colors.amber,
      //   primaryVariant: Colors.amberAccent,
      //   secondary: Colors.blueGrey,
      //   secondaryVariant: Colors.blueAccent,
      //   surface: surface,
      //   background: background,
      //   // error: error,
      //   // onPrimary: onPrimary,
      //   // onSecondary: onSecondary,
      //   // onSurface: onSurface,
      //   // onBackground: onBackground,
      //   // onError: onError,
      //   // brightness: brightness
      // )
      );
}

TextTheme _appTextTheme(TextTheme base) {
  return base.copyWith(
      headline1: base.headline1!.copyWith(fontWeight: FontWeight.bold),
      caption: base.caption!.copyWith(fontWeight: FontWeight.w400),
      bodyText1: const TextStyle(
          fontSize: 25, color: Colors.white, fontFamily: 'DancingScript'),
      bodyText2: const TextStyle(fontSize: 16.9, color: Colors.blue),
      button: base.button!.copyWith(
          letterSpacing: 1.0, fontFamily: 'DancingScript', fontSize: 20));
}

void main() {
  runApp(MaterialApp(
    home: MovieListView(),
    debugShowCheckedModeBanner: false,
    theme: _buildAppTheme(),
  ));

  // runApp(MaterialApp(
  //   home: const QuizApp(),
  //   debugShowCheckedModeBanner: false,
  //   theme: _buildAppTheme(),
  //   // theme: ThemeData(
  //   //     brightness: Brightness.dark,
  //   //     primaryColor: Colors.lightBlue[800],
  //   //     textTheme: const TextTheme(
  //   //         headline1: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
  //   //         bodyText1: TextStyle(fontSize: 42))
  //   //     // primarySwatch: Colors.pink,
  //   //     // appBarTheme: AppBarTheme(backgroundColor: Colors.lightBlue)
  //   //     ),
  // ));

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
