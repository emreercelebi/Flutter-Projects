import 'package:flutter/material.dart';
import 'journal_form.dart';
import 'settings_drawer.dart';
import 'journal_entry_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title, this.isDarkMode, this.onDarkModeToggle})
      : super(key: key);

  final String title;
  final bool isDarkMode;
  final Function onDarkModeToggle;
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    print('building homepage');
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
      body: JournalEntryList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToJournalForm(context),
      ),
      endDrawer: SettingsDrawer(
        isDarkMode: isDarkMode,
        onDarkModeToggle: onDarkModeToggle,
      ),
    );
  }

  void _navigateToJournalForm(context) {
    Navigator.of(context).pushNamed(JournalForm.route);
  }
}
