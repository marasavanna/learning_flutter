import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final List<String> catNames;

  CardWidget(this.catNames);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: catNames
            .map(
              (element) => Card(
                    child: Column(
                      children: <Widget>[
                        Image.network(
                            'https://images.mentalfloss.com/sites/default/files/styles/mf_image_16x9/public/549585-istock-909106260.jpg?itok=ds7LqH1N&resize=1100x1100'),
                        Text(element)
                      ],
                    ),
                  ),
            )
            .toList(),
      ),
    );
  }
}
