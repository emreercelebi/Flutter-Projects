import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final bool isDarkMode;

  WelcomeScreen({Key key, this.isDarkMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.book,
            size: 100.0,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome to your journal! Tap the add button to start writing entries',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
