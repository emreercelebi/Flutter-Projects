import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'home_page.dart';
import 'journal_form.dart';
import 'models/journal_entry.dart';
import 'journal_entry_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App(
    preferences: await SharedPreferences.getInstance(),
  ));
}

class App extends StatefulWidget {
  final SharedPreferences preferences;

  App({Key key, @required this.preferences}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  static const DARK_MODE_KEY = 'darkMode';

  bool get darkMode => widget.preferences.getBool(DARK_MODE_KEY) ?? false;

  List<JournalEntry> entries = [];

  @override
  void initState() {
    super.initState();
    loadJournalEntries();
  }

  void loadJournalEntries() async {
    final Database db = await openDatabase(
      'journal.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, body TEXT, rating TEXT, date DATETIME)');
      },
    );
    List<Map> journalRecords =
        await db.rawQuery('SELECT * FROM journal_entries');
    final journalEntryList = journalRecords.map((record) {
      return JournalEntry(
        title: record['title'],
        body: record['body'],
        rating: record['rating'],
        date: DateTime.parse(record['date']),
      );
    }).toList();
    this.setState(() {
      entries = journalEntryList;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('building in main');
    final darkModeText = Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        );
    final lightModeText = Theme.of(context).textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: darkMode ? Colors.cyan : Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: darkMode ? Color(0xff272727) : Colors.white,
        textTheme: darkMode ? darkModeText : lightModeText,
      ),
      routes: {
        HomePage.route: (context) => HomePage(
              title: 'Journal',
              isDarkMode: darkMode,
              onDarkModeToggle: this.setDarkMode,
              entries: entries,
            ),
        JournalForm.route: (context) => JournalForm(
            title: 'JournalForm',
            isDarkMode: darkMode,
            onDarkModeToggle: this.setDarkMode,
            reloadJournal: loadJournalEntries),
        JournalEntryDetails.route: (context) => JournalEntryDetails(),
      },
    );
  }

  void setDarkMode(value) {
    setState(() {
      widget.preferences.setBool(DARK_MODE_KEY, value);
    });
  }
}
