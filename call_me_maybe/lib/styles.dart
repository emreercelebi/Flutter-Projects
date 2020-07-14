import 'package:flutter/material.dart';

class Styles {
  static final String _fontFamilyName = 'Roboto';

  static final headingMain = TextStyle(
    fontFamily: _fontFamilyName,
    fontSize: 32.0,
    fontWeight: FontWeight.w600,
  );

  static final headingSub = TextStyle(
    fontFamily: _fontFamilyName,
    fontSize: 24.0,
    fontStyle: FontStyle.italic,
  );

  static final textLink = TextStyle(
    fontFamily: _fontFamilyName,
    fontSize: 14.0,
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );

  static final textLarge = TextStyle(
    fontFamily: _fontFamilyName,
    fontSize: 18.0,
  );
}
