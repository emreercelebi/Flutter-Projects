import 'package:flutter/material.dart';
import 'home_page.dart';
import 'journal_form.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  static final routes = {
    HomePage.route: (context) => HomePage(title: 'Journal'),
    JournalForm.route: (context) => JournalForm(title: 'JournalForm')
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routes,
    );
  }
}
