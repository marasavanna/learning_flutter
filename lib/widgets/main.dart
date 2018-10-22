import 'package:flutter/material.dart';
import 'card.dart';
import 'card_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(primarySwatch: Colors.brown),
      title: "Cards Layout",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cats"),
        ),
        body: CardManager(),
      ),
    );
  }
}
