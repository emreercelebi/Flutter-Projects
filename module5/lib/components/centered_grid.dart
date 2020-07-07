import 'package:flutter/material.dart';

class CenteredGrid extends StatelessWidget {
  final String title;

  const CenteredGrid({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(children: <Widget>[
          Row(children: <Widget>[
            Placeholder(),
            Placeholder(),
          ]),
          Row(children: <Widget>[
            Placeholder(),
            Placeholder(),
          ]),
        ]),
      ),
    );
  }
}