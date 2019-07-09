import 'package:flutter/material.dart';
import 'package:flutter_app/googlePlayMusic/Drawer.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ListenNow extends StatefulWidget {
  @override
  State createState() => new ListenNowState();
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return null;
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return null;
  }
}

class ListenNowState extends State<ListenNow> {
  MusicFinder player;

  void initPlayer() {
    setState(() {
      player = MusicFinder();
    });
  }

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

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
              onPressed: () => showSearch(context: context, delegate:CustomSearchDelegate()),
            )
          ],
        ),
        drawer: Drawer(child: MyDrawer()),
        body: StoreConnector<List<Song>, List<Widget>>(
            converter: (store) => store.state
                .map((s) => ListTile(
                      title: Text(s.title),
                      leading: Icon(Icons.music_note),
                      onTap: () {
                        player.stop();
                        player.play(s.uri, isLocal: true);
                      },
                    ))
                .toList(),
            builder: (context, viewModel) {
              return Scrollbar(child: ListView(children: viewModel));
            }));
  }
}
