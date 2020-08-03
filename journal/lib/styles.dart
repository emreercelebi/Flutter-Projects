import 'package:flutter/material.dart';

class Styles {
  static final String _fontFamilyName = 'Roboto';
  static final orangePrimary = 0xffE57200;
  static final orangeSecondary = 0xffEB5F0C;
  static final bluePrimary = 0xff232D4B;
  static final blueSecondary = 0xff141E3C;
  static final lightGray = 0xffF1F1EF;

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

  static final headingSubBold = TextStyle(
    fontFamily: _fontFamilyName,
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  );

  static final textLarge = TextStyle(
    fontFamily: _fontFamilyName,
    fontSize: 20.0,
  );

  static final textLargeBold = TextStyle(
    fontFamily: _fontFamilyName,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  static final textSub = TextStyle(
    fontFamily: _fontFamilyName,
    fontSize: 18.0,
  );

  static final textSubBold = TextStyle(
    fontFamily: _fontFamilyName,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  static final textSubItalic = TextStyle(
    fontFamily: _fontFamilyName,
    fontSize: 18.0,
    fontStyle: FontStyle.italic,
  );

  static final textBody = TextStyle(
    fontFamily: _fontFamilyName,
    fontSize: 14.0,
  );
}