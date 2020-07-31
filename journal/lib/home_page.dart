import 'package:flutter/material.dart';
import 'journal_form.dart';
import 'settings_drawer.dart';
import 'models/journal_entry.dart';
import 'helpers.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title, this.isDarkMode, this.onDarkModeToggle})
      : super(key: key);

  final String title;
  final bool isDarkMode;
  final Function onDarkModeToggle;
  static const String route = '/';

  final dummyData = [
    {
      'title': 'Entry #1',
      'body':
          'this is dummy data that I will be using to test the layout of the journal entries',
      'rating': 4,
      'date': new DateTime.now()
    },
    {
      'title': 'Entry #2',
      'body':
          'this is the second entry that I will be using to test the layout of the journal entries',
      'rating': 1,
      'date': new DateTime.now()
    },
    {
      'title': 'Entry #3',
      'body':
          'this is the third entry that I will be using to test the layout of the journal entries',
      'rating': 3,
      'date': new DateTime.now()
    }
  ];



  @override
  Widget build(BuildContext context) {
    final length = dummyData.length;
    final List<JournalEntry> journalEntries = dummyData.map( (entry) {
      return new JournalEntry(
          title: entry['title'],
          body: entry['body'],
          rating: entry['rating'],
          date: entry['date']
      );
    }).toList();
    print(journalEntries);
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
      body: ListView.builder(
        itemCount: length,
        itemBuilder: (context, i) {
          final entry = journalEntries[i];
          return ListTile(
            title: Text(entry.title),
            subtitle: Text(entry.body),
            trailing: Text(Helpers.dateToString(entry.date)),
          );
        }
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
