import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'settings_drawer.dart';

class JournalEntryFields {
  String title;
  String body;
  DateTime date;
  String rating;

  String toString() {
    return 'Title: $title, Body: $body, Time: $date, Rating: $rating';
  }

  void setValue(field, value) {
    switch (field) {
      case 'title':
        this.title = value;
        break;
      case 'body':
        this.body = value;
        break;
      case 'date':
        this.date = value;
        break;
      case 'rating':
        this.rating = value;
        break;
      default:
    }
  }
}

class JournalForm extends StatefulWidget {
  JournalForm(
      {Key key,
      this.title,
      this.isDarkMode,
      this.onDarkModeToggle,
      this.reloadJournal})
      : super(key: key);

  final String title;
  final bool isDarkMode;
  final Function onDarkModeToggle;
  final Function reloadJournal;
  static const String route = '/journalForm';

  @override
  _JournalFormState createState() => _JournalFormState();
}

class _JournalFormState extends State<JournalForm> {
  final formKey = GlobalKey<FormState>();
  final journalEntryFields = JournalEntryFields();

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
              _field(journalEntryFields, 'Title', 'Please enter a title',
                  'title', _validateNonEmpty, widget.isDarkMode),
              _field(journalEntryFields, 'Body', 'Please enter a body', 'body',
                  _validateNonEmpty, widget.isDarkMode),
              _field(
                  journalEntryFields,
                  'Rating',
                  'Please enter a number between 1 and 4',
                  'rating',
                  _validateRating,
                  widget.isDarkMode),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                    onPressed: ()  {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        journalEntryFields.date = DateTime.now();

                        final createQuery = await DefaultAssetBundle.of(context)
                            .loadString('lib/assets/create_table.txt');

                        final insertQuery = await DefaultAssetBundle.of(context)
                            .loadString('lib/assets/insert_query.txt');

//                        await deleteDatabase('journal.db');
                        final Database db = await openDatabase(
                          'journal.db',
                          version: 1,
                          onCreate: (Database db, int version) async {
                            await db.execute(createQuery);
                          },
                        );
                        await db.transaction((txn) async {
                          await txn.rawInsert(insertQuery, [
                            journalEntryFields.title,
                            journalEntryFields.body,
                            journalEntryFields.rating,
                            journalEntryFields.date.toIso8601String()
                          ]);
                        });

                        await db.close();
                        widget.reloadJournal();

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

  Widget _field(journalEntryFields, labelText, errorText, journalEntryField,
      validator, isDarkMode) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isDarkMode ? Colors.white : Colors.black,
              width: 1.0,
            ),
          ),
          hintStyle: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          labelStyle: TextStyle(
            color: isDarkMode ? Colors.white70 : Colors.black26,
          ),
        ),
        onSaved: (value) {
          journalEntryFields.setValue(journalEntryField, value);
        },
        validator: (value) {
          return validator(value, errorText);
        },
      ),
    );
  }
}
