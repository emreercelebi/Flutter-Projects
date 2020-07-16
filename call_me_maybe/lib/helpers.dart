import 'package:flutter/material.dart';

class Helpers {
  static final fullName = 'Emre Ercelebi';
  static final title = 'Software Engineer';
  static final email = 'emre@fakeemail.com';
  static final phoneNumber = '(804) 555-1234';
  static final phoneDigits = '8045551234';
  static final website =
      'https://media1.giphy.com/media/UTLjndqhYc1qlYmNwa/giphy.gif?cid=ecf05e47157c3f5a8ee55a62d6eafe0031aceff0df015431&rid=giphy.gif';
  static final predictorHeading = 'Call me...maybe?';
  static final predictorPrompt = 'Ask a question, tap for an answer.';

  static Widget styledText(text, style) {
    return Text(
      text,
      style: style,
    );
  }
}
