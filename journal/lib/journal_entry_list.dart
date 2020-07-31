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
    print('building journal entry list');
    final length = entries.length;
    return ListView.builder(
        itemCount: length,
        itemBuilder: (context, i) {
          final entry = entries[i];
          return ListTile(
            title: Text(entry.title),
            subtitle: Text(entry.body),
            trailing: Text(Helpers.dateToString(entry.date)),
          );
        }
    );
  }


}