import 'dart:ffi';

import 'package:flutter/material.dart';

class ScaffoldExample extends StatelessWidget {
  const ScaffoldExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _tapEmail() {
      debugPrint('Email Tapped');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaffold'),
        centerTitle: false,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
              onPressed: _tapEmail,
              icon: const Icon(
                Icons.email,
                color: Colors.white,
              )),
          const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.alarm,
                color: Colors.white,
              ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'Unit'),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Alarm'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Account'),
        ],
        onTap: (int index) => debugPrint('Tapped item: $index'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint('Hello from Floating button'),
        backgroundColor: Colors.white,
        child: Icon(Icons.add_a_photo, color: Colors.black),
      ),
      backgroundColor: Colors.white24,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            InkWell(
              child: Text(
                'Tap Me',
                style: TextStyle(fontSize: 30),
              ),
              onTap: null,
            ),
            CustomButton()
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('Button pressed');
        const snakbar = SnackBar(
            content: Text(
              'Hello from SnackBar',
            ),
            duration: Duration(seconds: 2));
        Scaffold.of(context).showSnackBar(snakbar);
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.pinkAccent, borderRadius: BorderRadius.circular(8.0)),
        child: const Text(
          'Button',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.deepOrange,
      child: Center(
          child: Text(
        'Hello Flutter!',
        textDirection: TextDirection.ltr,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      )),
    );
    // return const Center(
    //   child: Text('Hello flutter', textDirection: TextDirection.ltr,)
    // );
  }
}
