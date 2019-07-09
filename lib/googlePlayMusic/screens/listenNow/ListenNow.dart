import 'package:flutter/material.dart';
import 'package:flutter_app/googlePlayMusic/Drawer.dart';
import 'package:flute_music_player/flute_music_player.dart';

class ListenNow extends StatefulWidget {
  @override
  State createState() => new ListenNowState();
}

class ListenNowState extends State<ListenNow> {
  MusicFinder player;
  List<Song> songs;
  Future initPlayer() async {
    List<Song> _songs;
    try {
      _songs = await MusicFinder.allSongs();
    } catch (e) {
      print("Couldnt get songs " + e.toString());
    }
    setState(() {
      songs = _songs;
      player = MusicFinder();
    });
  }

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final songTiles = <Widget>[];
    if (songs != null) {
      print("Here");
      songTiles.addAll(songs.map((s) => ListTile(
            title: Text(s.title),
            leading: Icon(Icons.music_note),
            onTap: () {
              print("tapped " + s.uri);
              player.stop();
              player.play(s.uri, isLocal: true);
            },
          )));
    }
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
        body: ListView(
          children: songTiles,
        ));
  }
}
