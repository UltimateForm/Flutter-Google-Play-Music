import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                    child: ListTile(
                  title: Text("Recent activity",
                      style: Theme.of(context).textTheme.title),
                  subtitle: Text("Recently played or added"),
                  trailing: SizedBox(height: 22, width: 45, child:FlatButton(
                      child: Text('MORE', style: TextStyle(fontSize:4, color: Colors.white),),
                      onPressed: () {},
                      color: Theme.of(context).primaryColor,),
                      
                )))
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
