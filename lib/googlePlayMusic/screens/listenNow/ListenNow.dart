import 'dart:io';
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/googlePlayMusic/Drawer.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './SearchSong.dart';

class ListenNow extends StatefulWidget {
  final List<Song> songs;
  ListenNow(this.songs) : super();

  @override
  State createState() => new ListenNowState();
}

class HolyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      width: 52,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.0),
            color: Theme.of(context).primaryColor,
            shape: BoxShape.rectangle),
        child: Center(
          child: Text(
            'MORE',
            maxLines: 1,
            style: TextStyle(
                fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class ListenNowState extends State<ListenNow> {
  MusicFinder player;
  SearchSong _delegate;
  void initPlayer() {
    setState(() {
      player = MusicFinder();
    });
  }

  @override
  void initState() {
    super.initState();
    _delegate = SearchSong(widget.songs);
    initPlayer();
  }

  void playSong(Song song) {
    player.stop();
    player.play(song.uri, isLocal: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_arrow,
                      progress: _delegate.transitionAnimation),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
          ),
          title: Text("Listen Now"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                final Song result = await showSearch<Song>(
                    context: context, delegate: _delegate);
                if (result != null) playSong(result);
              },
            )
          ],
        ),
        drawer: Drawer(child: MyDrawer()),
        body: Container(
            padding: new EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                    child: ListTile(
                        title: Text("Recent activity",
                            style: Theme.of(context).textTheme.title),
                        subtitle: Text("Recently played or added"),
                        onTap: () {},
                        trailing: HolyButton())),
                Flexible(
                    child: Row(
                  children: <Widget>[
                    Flexible(
                        child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                              child: Image(
                            image: FileImage(File(widget.songs
                                .where((i) => i.albumArt != null)
                                .toList()[Random().nextInt(100)]
                                .albumArt)),
                            fit: BoxFit.contain,
                          )),
                          Text("Shuffle all")
                        ],
                      ),
                    )),
                    Flexible(
                        child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                              child: Image(
                            image: FileImage(File(widget.songs
                                .where((i) => i.albumArt != null)
                                .toList()[Random().nextInt(100)]
                                .albumArt)),
                            fit: BoxFit.contain,
                          )),
                          Text("Shuffle all")
                        ],
                      ),
                    )),
                    Flexible(
                        child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                              child: Image(
                            image: FileImage(File(widget.songs
                                .where((i) => i.albumArt != null)
                                .toList()[Random().nextInt(100)]
                                .albumArt)),
                            fit: BoxFit.contain,
                          )),
                          Text("Shuffle all")
                        ],
                      ),
                    )),
                  ],
                ))
              ],
            )));
  }

  Widget build_etc(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_arrow,
                      progress: _delegate.transitionAnimation),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
          ),
          title: Text("Listen Now"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                final Song result = await showSearch<Song>(
                    context: context, delegate: _delegate);
                if (result != null) playSong(result);
              },
            )
          ],
        ),
        drawer: Drawer(child: MyDrawer()),
        body: StoreConnector<List<Song>, List<Widget>>(
            converter: (store) => store.state
                .map((s) => ListTile(
                      title: Text(s.title),
                      subtitle: Text(s.artist),
                      leading: Icon(Icons.music_note),
                      onTap: () => playSong(s),
                    ))
                .toList(),
            builder: (context, viewModel) {
              return Scrollbar(child: ListView(children: viewModel));
            }));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline,
              ),
            );
          }),
        ),
      ),
    );
  }
}
