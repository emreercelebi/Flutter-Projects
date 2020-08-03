import 'package:flutter/material.dart';
import 'package:journal/models/details_args.dart';
import 'models/journal_entry.dart';
import 'helpers.dart';
import 'settings_drawer.dart';

class JournalEntryDetails extends StatelessWidget {
  final JournalEntry entry;

  JournalEntryDetails({Key key, this.entry}) : super(key: key);

  static const String route = '/details';

  @override
  Widget build(BuildContext context) {
    final DetailsArgs receivedValues =
        ModalRoute.of(context).settings.arguments;

    var journalEntry;
    var isDarkMode;
    var onDarkModeToggle;
    if (receivedValues == null) {
      journalEntry = entry;
    } else {
      journalEntry = receivedValues.entry;
      isDarkMode = receivedValues.isDarkMode;
      onDarkModeToggle = receivedValues.onDarkModeToggle;
    }

    if (journalEntry != null) {
      if (receivedValues != null) {
        //came from a route
        return Scaffold(
          appBar: AppBar(
            title: Text('Details'),
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              )
            ],
          ),
          body: detailsBody(journalEntry),
          endDrawer: SettingsDrawer(
            isDarkMode: isDarkMode,
            onDarkModeToggle: onDarkModeToggle,
          ),
        );
      } else {
        return detailsBody(journalEntry);
      }
    } else {
      return Text('select a journal entry');
    }
  }

  Widget detailsBody(journalEntry) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(journalEntry.title),
          Text(journalEntry.body),
          Text(journalEntry.rating),
          Text(Helpers.dateToString(journalEntry.date)),
        ],
      ),
    );
  }
}
