import 'package:flutter/material.dart';

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
    headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
);

class Entry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "test",
        theme: ThemeData(primaryColor: Colors.deepOrange),
        home: Scaffold(
            drawer: Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Container(
                      alignment: Alignment(-1.0, -1.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 36,
                            backgroundImage: NetworkImage(
                                "https://ssl.gstatic.com/images/branding/product/1x/avatar_square_blue_512dp.png",
                                scale: 0.1),
                          ),
                          Text(
                            "heliojmsemedo@gmail.com",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://cdn-images-1.medium.com/max/2600/1*l3wujEgEKOecwVzf_dqVrQ.jpeg")),
                    ),
                  ),
                  ListTile(
                    // leading: ClipOval(child: Icon(Icons.music_note), con),
                    title: Text('Item 1'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Text('Item 2'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              leading: Icon(Icons.menu),
              title: Text("Listen Now"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => null,
                )
              ],
            )));
  }
}
