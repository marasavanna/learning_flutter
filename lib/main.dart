import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Welcome to Flutter", home: RandomWords());
  }
}

class RandomWordsState extends State<RandomWords> {
  final nameSuggestions = <WordPair>[];
  final savedSuggestions = new Set<WordPair>();
  final biggerFont = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.list), onPressed: pushSaved),
        ],
      ),
      body: buildNameSuggestions(),
    );
  }

  Widget buildNameSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) {
            return Divider();
          }
          final index = i ~/ 2;
          // If you've reached the end of the available word pairings...
          if (index >= nameSuggestions.length) {
            // ...then generate 10 more and add them to the suggestions list.
            nameSuggestions.addAll(generateWordPairs().take(10));
          }

          return buildRow(nameSuggestions[index]);
        });
  }

  Widget buildRow(WordPair pair) {
    final bool alreadySaved = savedSuggestions.contains(pair);
    return ListTile(
      title: Text(pair.asPascalCase, style: biggerFont),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            savedSuggestions.remove(pair);
          } else {
            savedSuggestions.add(pair);
          }
        });
      },
    );
  }

  void pushSaved() {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile>tiles = savedSuggestions.map((WordPair pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: biggerFont,
          ),
        );
      });
      final divided = ListTile.divideTiles(tiles: tiles);
      return new Scaffold(
        appBar: new AppBar(
          title: const Text("Saved items"),
        ),
        body: new ListView(children: divided),
      );
    }));
  }
}

class RandomWords extends StatefulWidget {
  RandomWordsState createState() => new RandomWordsState();
}
