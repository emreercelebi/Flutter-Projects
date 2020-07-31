import 'package:flutter/material.dart';
import 'settings_drawer.dart';

class JournalForm extends StatefulWidget {
  JournalForm({Key key, this.title, this.isDarkMode, this.onDarkModeToggle})
      : super(key: key);

  final String title;
  final bool isDarkMode;
  final Function onDarkModeToggle;
  static const String route = '/journalForm';

  @override
  _JournalFormState createState() => _JournalFormState();
}

class _JournalFormState extends State<JournalForm> {
  final formKey = GlobalKey<FormState>();

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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              _field(
                  'Title', 'Please enter a title', 'title', _validateNonEmpty),
              _field('Body', 'Please enter a body', 'body', _validateNonEmpty),
              _field('Rating', 'Please enter a number between 1 and 4',
                  'rating', _validateRating),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      endDrawer: SettingsDrawer(
        isDarkMode: widget.isDarkMode,
        onDarkModeToggle: widget.onDarkModeToggle,
      ),
    );
  }

  _validateNonEmpty(value, errorText) {
    if (value.isEmpty) {
      return errorText;
    } else {
      return null;
    }
  }

  _validateRating(value, errorText) {
    if (value.isEmpty) {
      return errorText;
    }
    var rating = int.tryParse(value);

    if (rating == null) {
      return errorText;
    }

    if (rating < 1 || rating > 4) {
      return errorText;
    }

    return null;
  }

  Widget _field(labelText, errorText, journalEntryField, validator) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
        onSaved: (value) {
          //store value in journal entry object
          print(journalEntryField + ' saved');
        },
        validator: (value) {
          return validator(value, errorText);
        },
      ),
    );
  }
}
