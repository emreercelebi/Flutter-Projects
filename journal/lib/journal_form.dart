import 'package:flutter/material.dart';

class JournalForm extends StatelessWidget {
  JournalForm({Key key, this.title}) : super(key: key);

  final String title;
  static const String route = '/journalForm';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Text(
          'this is the journal form page'), // This trailing comma makes auto-formatting nicer for build methods.
      endDrawer: Drawer(
        child: Text('this is the settings drawer'),
      ),
    );
  }
}
