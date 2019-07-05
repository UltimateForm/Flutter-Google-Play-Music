import 'package:flutter/material.dart';

class StackTest extends StatelessWidget {
  StackTest({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "hi stack",
      home: Scaffold(
        appBar: AppBar(title: Text(this.title)),
        body: SizedBox(
          width: 250,
          height: 250,
          child: Stack(
            children: <Widget>[
              Container(
                width: 250,
                height: 250,
                color: Colors.red,
              ),
              Container(
                width: 200,
                height: 200,
                padding: EdgeInsets.all(5.0),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.blue.withAlpha(0),
                      Colors.green,
                      Colors.yellow,
                      Colors.cyan
                    ],
                  ),
                ),
                child: Text(
                  "Foreground Text",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
      theme: ThemeData.light(),
    );
  }
}
