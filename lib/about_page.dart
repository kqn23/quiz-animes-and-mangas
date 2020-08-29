import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPage createState() => _AboutPage();
}

class _AboutPage extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("A Propos"),
      ),
      body: Center(
        child: Text(
          "Testez vos connaissances sur les animés et mangas populaires",
          textAlign: TextAlign.center,
          style: TextStyle(
            backgroundColor: Colors.grey[100],
            fontSize: 20.0,
            letterSpacing: 2.0,
          ),
        ),
      ),
    );
  }
}
