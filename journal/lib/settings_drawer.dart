import 'package:flutter/material.dart';

class SettingsDrawer extends StatefulWidget {
  final bool isDarkMode;
  final Function onDarkModeToggle;

  SettingsDrawer({Key key, this.isDarkMode, this.onDarkModeToggle})
      : super(key: key);

  @override
  _SettingsDrawerState createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends State<SettingsDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: widget.isDarkMode ? Color(0xff272727) : Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 16.0),
              child: Text('Settings'),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text('Dark Mode'),
                  Switch(
                    value: widget.isDarkMode,
                    onChanged: (value) {
                      widget.onDarkModeToggle(value);
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
