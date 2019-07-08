import 'package:flutter/material.dart';
import 'package:flutter_app/googlePlayMusic/Drawer.dart';

class Recents extends StatelessWidget {
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
        title: Text("Recents"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => null,
          )
        ],
      ),
      drawer: Drawer(child: MyDrawer()),
    );
  }
}
