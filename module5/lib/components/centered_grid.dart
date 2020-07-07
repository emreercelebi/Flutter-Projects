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
        body: Column(
          children: <Widget>[
            BoxRow(),
            BoxRow(),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  final double dim;

  const Box({Key key, this.dim}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        child: Placeholder(),
        width: dim,
        height: dim,
      ),
    );
  }
}

class BoxRow extends StatelessWidget {
  final dim = 100.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Box(dim: dim),
        Box(dim: dim),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
