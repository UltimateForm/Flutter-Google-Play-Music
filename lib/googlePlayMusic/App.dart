import 'package:flutter/material.dart';
import 'package:flutter_app/googlePlayMusic/screens/listenNow/ListenNow.dart';
import 'package:flutter_app/googlePlayMusic/screens/recents/Recents.dart';

ThemeData myTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.light,
  primaryColor: Colors.deepOrange,
  accentColor: Colors.orange[600],

  // Define the default font family.
  fontFamily: 'Montserrat',

  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    headline: TextStyle(
        fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
    title: TextStyle(
        fontSize: 36.0, fontStyle: FontStyle.italic, color: Colors.white),
    body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white),
  ),
);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      theme: ThemeData(primaryColor: Colors.deepOrange),
      routes: {
        "listenNow": (BuildContext context) => ListenNow(),
        "recents": (BuildContext context) => Recents()
      },
      home: ListenNow(),
    );
  }
}
