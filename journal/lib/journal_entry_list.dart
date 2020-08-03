import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'models/journal_entry.dart';
import 'helpers.dart';
import 'welcome_screen.dart';

class JournalEntryList extends StatefulWidget {

  final List<JournalEntry> entries;
  final bool isDarkMode;

  JournalEntryList({Key key, this.entries, this.isDarkMode}) : super(key: key);

  @override
  _JournalEntryListState createState() => _JournalEntryListState();
}

class _JournalEntryListState extends State<JournalEntryList> {

  @override
  Widget build(BuildContext context) {
    final length = widget.entries.length;
    if (length == 0) {
      return WelcomeScreen(
        isDarkMode: widget.isDarkMode,
      );
    } else {
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

}