import 'package:flutter/material.dart';

class CardControl extends StatelessWidget {
  final Function addCat;

  CardControl(this.addCat);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      child: Text("Add cat"),
      onPressed: () {
        addCat("Jeana");
      },
    );
  }
}
