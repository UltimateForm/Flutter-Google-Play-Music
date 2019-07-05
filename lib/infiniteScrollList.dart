import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class InifiniteScrollExample extends StatelessWidget {

  @override
  Widget build(dynamic context) {
    return MaterialApp(title: "MY APP LUL", home: RandomWords(), theme: ThemeData.light(),);
  }
}

class RandomWords extends StatefulWidget {
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18);

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(title: Text(pair.join(' '), style: _biggerFont), onLongPress: ()=>print(pair.asLowerCase),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("InifiniteScrollExample")),
      body: _buildSuggestions(),
      floatingActionButton: FloatingActionButton(onPressed: ()=>print("floating button click"), child: Icon(Icons.account_circle),),
    );
  }
}
