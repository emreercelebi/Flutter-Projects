import 'package:flutter/material.dart';
import 'settings_drawer.dart';

class JournalForm extends StatelessWidget {
  JournalForm({Key key, this.title}) : super(key: key);

  final String title;
  static const String route = '/journalForm';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          )
        ],
      ),
      body: Text(
          'this is the journal form page'), // This trailing comma makes auto-formatting nicer for build methods.
      endDrawer: SettingsDrawer(),
    );
  }
}
