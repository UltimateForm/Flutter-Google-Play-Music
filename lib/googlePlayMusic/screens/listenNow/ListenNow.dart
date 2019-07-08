import 'package:flutter/material.dart';
import 'package:flutter_app/googlePlayMusic/Drawer.dart';

class ListenNow extends StatefulWidget {
  @override
  State createState() => new ListenNowState();
}

class ListenNowState extends State<ListenNow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
                icon: new Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
        title: Text("Listen Now"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => {},
          )
        ],
      ),
      drawer: Drawer(child: MyDrawer()),
    );
  }
}
