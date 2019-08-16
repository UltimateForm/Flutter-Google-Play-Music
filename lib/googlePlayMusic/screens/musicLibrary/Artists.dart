import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/googlePlayMusic/AppState.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ArtistCard extends StatelessWidget {
  final Artist artist;
  ArtistCard(this.artist) : super();
  @override
  Widget build(BuildContext context) {
    Widget img = artist.art != null && artist.art.isNotEmpty
        ? Image.file(File(artist.art))
        : Container(
            color: Colors.grey.shade300,
            child: Center(
              child: Icon(MdiIcons.artist),
            ),
          );
    // TODO: implement build
    return Container(
        child: Card(
          semanticContainer: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: <Widget>[
                img,
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                      width: 56,
                      height: 56,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          padding: EdgeInsets.all(0),
                          iconSize: 24,
                          alignment: Alignment.center,
                          icon: Icon(Icons.play_arrow),
                        ),
                      ),
                    ),
                    Container(
                      height: 36,
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                              child: Text(
                            artist.name,
                            overflow: TextOverflow.ellipsis,
                          )),
                          Icon(Icons.more_vert)
                        ],
                      ),
                      color: Colors.white,
                    )
                  ],
                )
              ],
            )));
  }
}

class LibraryArtists extends StatelessWidget {
  final List<Artist> artists;
  LibraryArtists(this.artists) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      // Generate 100 widgets that display their index in the List.
      childAspectRatio: 4/3,
      children:
          List.generate(artists.length, (index) => ArtistCard(artists[index])),
    );
  }
}
