import 'package:flutter/material.dart';

import 'card.dart';
import 'card_control.dart';

class CardManager extends StatefulWidget {
  final String startingName;

  CardManager({this.startingName = "Lola"});

  @override
  State<StatefulWidget> createState() {
    return CardManagerState();
  }
}

class CardManagerState extends State<CardManager> {
  List<String> catNames = [];

  @override
  void initState() {
    catNames.add(widget.startingName);
    super.initState();
  }

  void addCat(String catName) {
    setState(() {
      catNames.add(catName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardWidget(catNames),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: CardControl(addCat),
        ),
      ],
    );
  }
}
