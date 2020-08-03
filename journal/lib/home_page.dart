import 'package:flutter/material.dart';
import 'package:journal/models/journal_entry.dart';
import 'journal_form.dart';
import 'settings_drawer.dart';
import 'journal_entry_list.dart';
import 'journal_entry_details.dart';

class HomePage extends StatefulWidget {
  HomePage(
      {Key key,
      this.title,
      this.isDarkMode,
      this.onDarkModeToggle,
      this.entries})
      : super(key: key);

  final String title;
  final bool isDarkMode;
  final Function onDarkModeToggle;
  final List<JournalEntry> entries;
  static const String route = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedEntry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
      body: Container(
        child: LayoutBuilder(
          builder: (context, constraints) {
            print(constraints);
            return constraints.maxWidth < 700
                ? verticalLayout()
                : horizontalLayout();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToJournalForm(context),
        child: Icon(Icons.add),
      ),
      endDrawer: SettingsDrawer(
        isDarkMode: widget.isDarkMode,
        onDarkModeToggle: widget.onDarkModeToggle,
      ),
    );
  }

  Widget verticalLayout() {
    return JournalEntryList(
      isDarkMode: widget.isDarkMode,
      entries: widget.entries,
      selectEntry: selectEntry,
      onDarkModeToggle: widget.onDarkModeToggle,
    );
  }

  Widget horizontalLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: 400.0),
          child: JournalEntryList(
            isDarkMode: widget.isDarkMode,
            entries: widget.entries,
            selectEntry: selectEntry,
            onDarkModeToggle: widget.onDarkModeToggle,
          ),
        ),
        Expanded(
          child: JournalEntryDetails(
            entry: selectedEntry,
          ),
        ),
      ],
    );
  }

  void selectEntry(journalEntry) {
    setState(() {
      selectedEntry = journalEntry;
    });
  }

  void _navigateToJournalForm(context) {
    Navigator.of(context).pushNamed(JournalForm.route);
  }
}
