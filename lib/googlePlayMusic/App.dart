import 'package:flutter/material.dart';
import 'package:flutter_app/googlePlayMusic/screens/listenNow/ListenNow.dart';
import 'package:flutter_app/googlePlayMusic/screens/recents/Recents.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

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

enum Actions { SetSongs, AddSong }

List<Song> songsReducer(List<Song> state, dynamic action) {
  if (action == Actions.AddSong) {
    return state;
  }
  return state;
}

Future<List<Song>> initPlayer() async {
  List<Song> _songs;
  try {
    _songs = await MusicFinder.allSongs();
  } catch (e) {
    print("Couldnt get songs " + e.toString());
  }
  return _songs;
}

Future gpmMain() async {
  List<Song> songs = await initPlayer();
  final _songstore = new Store<List<Song>>(songsReducer, initialState: songs);
  runApp(App(title: "Google play music :^)", songstore: _songstore));
}

class App extends StatelessWidget {
  final Store<List<Song>> songstore;
  final String title;

  App({Key key, this.songstore, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("here ahaha");
    return StoreProvider<List<Song>>(
        store: songstore,
        child: MaterialApp(
          title: title,
          theme: ThemeData(primaryColor: Colors.deepOrange),
          routes: {
            "listenNow": (BuildContext context) => ListenNow(),
            "recents": (BuildContext context) => Recents()
          },
          home: ListenNow(),
        ));
  }
}
