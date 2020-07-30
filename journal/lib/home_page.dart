import 'package:flutter/material.dart';
import 'journal_form.dart';
import 'settings_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;
  static const String route = '/';

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
          'hello'), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToJournalForm(context),
      ),
      endDrawer: SettingsDrawer(),
    );
  }

  void _navigateToJournalForm(context) {
    Navigator.of(context).pushNamed(JournalForm.route);
  }
}
