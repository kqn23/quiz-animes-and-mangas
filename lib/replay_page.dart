import 'package:flutter/material.dart';

import 'main.dart';
import 'quiz_page.dart';

class ReplayPage extends StatefulWidget {
  int s;

  ReplayPage(int _s) { s = _s; }

  @override
  _ReplayPageState createState() => _ReplayPageState(s);
}

class _ReplayPageState extends State<ReplayPage> {
  int score;

  _ReplayPageState(int _s) {
    score = _s;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Score : ${score}",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.orange[800],
              ),
            ),
            SizedBox(height: 20.0),
            FlatButton.icon(
              icon: Icon(Icons.replay),
              label: Text("Rejouer"),
              onPressed: (){
                Navigator.pushReplacement(context, new MaterialPageRoute
                  (builder: (BuildContext context) => new PlayPage()));
              },
            ),
            SizedBox(height: 5.0),
            FlatButton.icon(
              icon: Icon(Icons.home),
              label: Text("Accueil"),
              onPressed: (){
                Navigator.pushReplacement(context, new MaterialPageRoute
                  (builder: (BuildContext context) => new MyHomePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
