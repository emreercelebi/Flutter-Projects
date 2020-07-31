import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'models/journal_entry.dart';
import 'helpers.dart';

class JournalEntryList extends StatefulWidget {
  @override
  _JournalEntryListState createState() => _JournalEntryListState();
}

class _JournalEntryListState extends State<JournalEntryList> {

  List<JournalEntry> entries = [];

  final dummyData = [
    {
      'title': 'Entry #1',
      'body':
      'this is dummy data that I will be using to test the layout of the journal entries',
      'rating': '4',
      'date': new DateTime.now()
    },
    {
      'title': 'Entry #2',
      'body':
      'this is the second entry that I will be using to test the layout of the journal entries',
      'rating': '1',
      'date': new DateTime.now()
    },
    {
      'title': 'Entry #3',
      'body':
      'this is the third entry that I will be using to test the layout of the journal entries',
      'rating': '3',
      'date': new DateTime.now()
    }
  ];

  @override
  void initState() {
    super.initState();
    _loadJournalEntries();
  }

  void _loadJournalEntries() async {
    final Database db = await openDatabase(
      'journal.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, body TEXT, rating TEXT, date DATETIME)');
      },
    );
    List<Map> journalRecords = await db.rawQuery('SELECT * FROM journal_entries');
    print(journalRecords);
  }

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
    return ListView.builder(
        itemCount: length,
        itemBuilder: (context, i) {
          final entry = journalEntries[i];
          return ListTile(
            title: Text(entry.title),
            subtitle: Text(entry.body),
            trailing: Text(Helpers.dateToString(entry.date)),
          );
        }
    );
  }


}