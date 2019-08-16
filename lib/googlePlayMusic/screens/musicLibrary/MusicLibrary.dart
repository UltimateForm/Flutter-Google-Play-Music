import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/googlePlayMusic/AppState.dart';
import 'package:flutter_app/googlePlayMusic/Drawer.dart';
import 'package:flutter_app/googlePlayMusic/screens/musicLibrary/Albums.dart';
import 'package:flutter_app/googlePlayMusic/screens/musicLibrary/Artists.dart';
import 'package:flutter_app/googlePlayMusic/screens/musicLibrary/Genres.dart';
import 'package:flutter_app/googlePlayMusic/screens/musicLibrary/Playlists.dart';
import 'package:flutter_app/googlePlayMusic/screens/musicLibrary/Songs.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:queries/collections.dart';

List<KeyValuePair> appBarTabs = [
  KeyValuePair("playlists", "PLAYLISTS"),
  KeyValuePair("artists", "ARTISTS"),
  KeyValuePair("albums", "ALBUMS"),
  KeyValuePair("songs", "SONGS"),
  KeyValuePair("genres", "GENRES")
];

class LibraryData {
  List<int> playlists;
  List<Artist> artists;
  List<Album> albums;
  List<Song> songs;
  List<String> genres;
  LibraryData(this.playlists, this.artists, this.albums, this.songs, this.genres);
}

class MusicLibrary extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, LibraryData>(
      converter: (app)=>LibraryData(null, app.state.artists, app.state.albums, app.state.songs, null),
      builder: (context, data){
        return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: new Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            title: Text("Music Library"),
            bottom: TabBar(
              indicatorColor: Colors.white,
              isScrollable: true,
              tabs: appBarTabs
                  .map((KeyValuePair kvp) => Tab(
                        text: kvp.value,
                        key: Key(kvp.key),
                      ))
                  .toList(),
            ),
          ),
          body: TabBarView(children: [
            LibraryPlaylists(),
            LibraryArtists(data.artists),
            LibraryAlbums(),
            LibrarySongs(),
            LibraryGenres()
          ]),
          drawer: Drawer(child: MyDrawer()),
        ));
      },
    );
     
  }
}
