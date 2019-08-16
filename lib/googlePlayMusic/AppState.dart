import 'package:flute_music_player/flute_music_player.dart';
import "package:collection/collection.dart";

enum PlaybackStates { Playing, Pause }

class Album {
  String name;
  String artist;
  int id;
  String art;
  List<Song> songs;
  Album(this.id, this.name, this.artist, this.art, this.songs);
}

class Artist {
  String name;
  String art;
  List<Song> songs;
  List<Album> albums;
  Artist(this.name, this.art, this.songs, this.albums);
}

class AppState {
  List<Song> songs;
  List<Album> albums;
  List<Artist> artists;

  PlaybackStates playbackState;

  AppState(this.songs) {
    playbackState = PlaybackStates.Pause;
    albums = List<Album>();
    artists = List<Artist>();
    this._populateAlbums();
    this._populateArtists();
  }

  _populateAlbums() {
    var albumMaps = groupBy<Song, int>(songs, (obj) => obj.albumId);
    for (var id in albumMaps.keys) {
      albums.add(Album(id, albumMaps[id][0].album, albumMaps[id][0].artist, albumMaps[id][0].albumArt, albumMaps[id]));
    }
  }

  _populateArtists() {
    var artistsMap = groupBy<Song, String>(songs, (obj) => obj.artist);
    for (var artist in artistsMap.keys) {
      List<Album> albs = albums.where((al)=>al.artist==artist).toList();
      String art = albs.length>0? albs[0].art : "";
      artists.add(Artist(artist, art, artistsMap[artist], albs));
    }
  }
}
