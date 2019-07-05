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
    headline: TextStyle(
        fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
    title: TextStyle(
        fontSize: 36.0, fontStyle: FontStyle.italic, color: Colors.white),
    body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white),
  ),
);

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
            accountEmail: Text("heliojmsemedo@gmail.com"),
            accountName: Text("Hélio"),
            currentAccountPicture: CircleAvatar(
              radius: 36,
              backgroundImage: AssetImage("assets/images/userAvatar.png"),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/accountBanner.jpeg")),
            )),
        ListTile(
          dense: true,
          leading: Icon(Icons.play_circle_filled),
          title: Text('Listen Now'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(context,
                new MaterialPageRoute(builder: (ctxt) => new ListenNow()));
          },
        ),
        ListTile(
          leading: Icon(Icons.settings_backup_restore),
          title: Text('Recents'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(context,
                new MaterialPageRoute(builder: (ctxt) => new Recents()));
          },
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text('Top charts'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
            leading: Icon(Icons.new_releases),
            title: Text("New releases"),
            onTap: () {
              // Update the state of the app.
              // ...
            }),
        ListTile(
            leading: Icon(Icons.library_music),
            title: Text("Music library"),
            onTap: () {
              //ignore
            }),
        ListTile(
            leading: Icon(Icons.shop),
            title: Text("Shop"),
            onTap: () {
              //ignore
            }),
        Divider(),
        ListTile(
            title: Text("Downloaded only"),
            trailing: Switch(
              value: false,
              onChanged: (val) => {},
            ),
            onTap: () {
              //ignore
            }),
        ListTile(
            title: Text("Settings"),
            onTap: () {
              //ignore
            }),
        ListTile(
            title: Text("Help and feedback"),
            onTap: () {
              //ignore
            })
      ],
    );
  }
}

class ListenNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Listen Now"),
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

class Recents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
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

class Entry extends StatelessWidget {
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
