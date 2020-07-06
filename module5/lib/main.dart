import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 5 Explorations',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainScreen(title: 'Week 5 Explorations'),
    );
  }
}

class MainScreen extends StatelessWidget {
  final String title;

  const MainScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
            child: Text(title, style: Theme.of(context).textTheme.headline)));
  }
}
