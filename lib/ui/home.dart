import 'package:flutter/material.dart';

class Wisdom extends StatefulWidget {
  const Wisdom({Key? key}) : super(key: key);

  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = [
    'void main() is the start',
    'Everything in Flutter is Widget/Component',
    'runApp() takes three kinds of application',
    'WidgetsApp - Little bit low level; Not provide inbuild design support',
    'MaterialApp - build with so much design ',
    'CupertinoApp - Human interface design',
    'Changes in runApp() needs to click \'restart\' to see the output.',
    'Scaffold() widget is kind of structure with some basic widgets',
    'StatelessWidget - not supposed to change',
    'Container & Text are the most powerful widgets',
    'BuildContext - Knows the location of the Widget in the widget tree. It is a widget of widgets!'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        quotes[_index],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: TextButton.icon(
                      onPressed: _showQuote,
                      icon: const Icon(Icons.surfing),
                      label: const Text('Inspire Me!'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white))),
                ),
                Spacer()
              ],
            ),
          ),
        ));
  }

  void _showQuote() {
    setState(() {
      _index = ++_index % quotes.length;
    });
  }
}

class BizCard extends StatelessWidget {
  const BizCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BizCard'),
        ),
        backgroundColor: Colors.black,
        body: Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[_getCard(), _getAvatar()],
          ),
        ));
  }

  Container _getCard() {
    return Container(
        width: 350,
        height: 200,
        margin: const EdgeInsets.all(50),
        decoration: BoxDecoration(
            color: Colors.pinkAccent, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Sujan Mridha',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text('sujanmridha.com'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.facebook_outlined, color: Colors.white),
                Text('/sujanm.cse5.bu')
              ],
            )
          ],
        ));
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.redAccent, width: 1.2),
          image: const DecorationImage(
              image: NetworkImage('https://picsum.photos/300'),
              fit: BoxFit.cover)),
    );
  }
}

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
