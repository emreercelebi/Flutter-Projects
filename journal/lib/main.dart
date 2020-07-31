import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'journal_form.dart';

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
            ),
        JournalForm.route: (context) => JournalForm(
              title: 'JournalForm',
              isDarkMode: darkMode,
              onDarkModeToggle: this.setDarkMode,
              reloadJournal: reloadJournal
            ),
      },
    );
  }

  void setDarkMode(value) {
    setState(() {
      widget.preferences.setBool(DARK_MODE_KEY, value);
    });
  }

  void reloadJournal() {
    print('calling setstate in main');
    setState((){});
  }
}
