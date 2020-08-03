import 'package:flutter/material.dart';
import 'models/journal_entry.dart';
import 'models/details_args.dart';
import 'helpers.dart';
import 'welcome_screen.dart';
import 'journal_entry_details.dart';
import 'styles.dart';

class JournalEntryList extends StatelessWidget {
  final List<JournalEntry> entries;
  final bool isDarkMode;
  final Function onDarkModeToggle;
  final Function selectEntry;

  JournalEntryList(
      {Key key,
      this.entries,
      this.isDarkMode,
      this.selectEntry,
      this.onDarkModeToggle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final length = entries.length;
    if (length == 0) {
      return WelcomeScreen(
        isDarkMode: isDarkMode,
      );
    } else {
      return ListView.builder(
          itemCount: length,
          itemBuilder: (context, i) {
            final entry = entries[i];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  entry.title,
                  style: Styles.headingSubBold,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                  child: Text(entry.body,
                  style: Styles.textSub,),
                ),
                trailing: Text(Helpers.dateToString(entry.date)),
                onTap: () {
                  selectEntry(entry);
                  if (MediaQuery.of(context).size.width < 700) {
                    Navigator.of(context).pushNamed(
                      JournalEntryDetails.route,
                      arguments: DetailsArgs(
                          entry: entry,
                          isDarkMode: isDarkMode,
                          onDarkModeToggle: onDarkModeToggle),
                    );
                  }
                },
              ),
            );
          });
    }
  }
}
