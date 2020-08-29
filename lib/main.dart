import 'package:flutter/material.dart';

import 'quiz_page.dart';
import 'about_page.dart';

void main() {
  runApp(MaterialApp(
    home: const MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _beginGame() => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new PlayPage()));
  void _getAbout() => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new AboutPage()));

  Widget _createMainRaisedButton (String text,MaterialColor color, Icon icon, Function onPressed) {
    return RaisedButton.icon(
      color: color,
      label: Text(
        text,
        style: TextStyle(
          fontSize: 20.0,
          letterSpacing: 2.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      icon: icon,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: _screenSize.width,
              child: Center(
                child: Card(
                  elevation: 10.0,
                  margin: EdgeInsets.only(top: _screenSize.height / 10),
                  child: Image.asset("assets/Logo.PNG"),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: _screenSize.width,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _createMainRaisedButton("Démarrer",Colors.red, Icon(Icons.play_arrow,color: Colors.white,), _beginGame),
                    _createMainRaisedButton("A propos",Colors.orange, Icon(Icons.help_outline,color: Colors.white,), _getAbout),
                  ],
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
