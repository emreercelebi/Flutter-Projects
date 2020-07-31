import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'models/journal_entry.dart';
import 'helpers.dart';

class JournalEntryList extends StatefulWidget {

  final List<JournalEntry> entries;

  JournalEntryList({Key key, this.entries}) : super(key: key);

  @override
  _JournalEntryListState createState() => _JournalEntryListState();
}

class _JournalEntryListState extends State<JournalEntryList> {

  @override
  Widget build(BuildContext context) {
    print('building journal entry list');
    final length = widget.entries.length;
    return ListView.builder(
        itemCount: length,
        itemBuilder: (context, i) {
          final entry = widget.entries[i];
          return ListTile(
            title: Text(entry.title),
            subtitle: Text(entry.body),
            trailing: Text(Helpers.dateToString(entry.date)),
          );
        }
    );
  }


}