import 'package:flutter/material.dart';
import 'package:flute_music_player/flute_music_player.dart';

class _SuggestionList extends StatelessWidget {
  const _SuggestionList({this.suggestions, this.query, this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions[i];
        return ListTile(
          leading: query.isEmpty ? const Icon(Icons.history) : const Icon(null),
          title: RichText(
            text: TextSpan(
              text: suggestion.substring(0, query.length),
              style:
                  theme.textTheme.subhead.copyWith(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: suggestion.substring(query.length),
                  style: theme.textTheme.subhead,
                ),
              ],
            ),
          ),
          onTap: () {
            onSelected(suggestion);
          },
        );
      },
    );
  }
}

class SearchSong extends SearchDelegate<Song> {
  final List<Song> _data;
  // final List<Song> _history = []

  SearchSong(this._data) : super();

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return null;
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: "Back",
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Song> results = _data.where((s) {
      return s.title == query ||
          s.title.startsWith(query) ||
          s.album == query ||
          s.album.startsWith(query) ||
          s.artist == query ||
          s.artist.startsWith(query);
    }).toList();

    return ListView(
      children: results
          .map<Widget>((r) => ListTile(
                title: Text(r.title),
                subtitle: Text(r.artist),
                leading: Icon(Icons.search),
                onTap: () {},
              ))
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = query.isEmpty
        ? []
        : _data
            .where((s) =>
                s.title.startsWith(query) ||
                s.artist.startsWith(query) ||
                s.album.startsWith(query))
            .map((so) {
            if (so.title.startsWith(query)) return so.title;
            if (so.artist.startsWith(query)) return so.artist;
            if (so.album.startsWith(query)) return so.album;
          }).toSet().toList();
    return _SuggestionList(
      query: query,
      suggestions: suggestions,
      onSelected: (sug) {
        query = sug;
        showResults(context);
      },
    );
  }
}
