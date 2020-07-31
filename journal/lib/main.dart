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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        HomePage.route: (context) => HomePage(
              title: 'Journal',
              isDarkMode: darkMode,
              onDarkModeToggle: this.setDarkMode,
            ),
        JournalForm.route: (context) => JournalForm(title: 'JournalForm')
      },
    );
  }

  void setDarkMode(value) {
    setState(() {
      widget.preferences.setBool(DARK_MODE_KEY, value);
    });
  }
}
