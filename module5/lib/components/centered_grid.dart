import 'package:flutter/material.dart';

class CenteredGrid extends StatelessWidget {
  final String title;

  const CenteredGrid({Key key, this.title}) : super(key: key);

  final dim = 100.0;

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
            SizedBox(
              child: Placeholder(),
              width: dim,
              height: dim,
            ),
            SizedBox(
              child: Placeholder(),
              width: dim,
              height: dim,
            ),
          ]),
          Row(children: <Widget>[
            SizedBox(
              child: Placeholder(),
              width: dim,
              height: dim,
            ),
            SizedBox(
              child: Placeholder(),
              width: dim,
              height: dim,
            ),
          ]),
        ]),
      ),
    );
  }
}
