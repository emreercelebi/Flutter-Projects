import 'journal_entry.dart';

class DetailsArgs {
  final JournalEntry entry;
  final bool isDarkMode;
  final Function onDarkModeToggle;

  DetailsArgs({this.entry, this.isDarkMode, this.onDarkModeToggle});
}