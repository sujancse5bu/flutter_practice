import 'package:flutter/material.dart';
class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.deepOrange,
      child: Center(child: Text(
        'Hello Flutter!', 
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30
        ),
      )),
      
    );
    // return const Center(
    //   child: Text('Hello flutter', textDirection: TextDirection.ltr,)
    // );
  }
}