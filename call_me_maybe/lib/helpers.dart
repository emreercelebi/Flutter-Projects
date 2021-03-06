import 'package:flutter/material.dart';

class Helpers {
  static final fullName = 'Emre Ercelebi';
  static final title = 'Software Engineer';
  static final email = 'emre@fakeemail.com';
  static final phoneNumber = '(804) 555-1234';
  static final phoneDigits = '8045551234';
  static final websiteText = 'NeverForget.com';
  static final website =
      'https://media1.giphy.com/media/UTLjndqhYc1qlYmNwa/giphy.gif?cid=ecf05e47157c3f5a8ee55a62d6eafe0031aceff0df015431&rid=giphy.gif';
  static final predictorHeading = 'Call me...maybe?';
  static final predictorPrompt = 'Ask a question, tap for an answer.';

  static Widget styledText(text, style, {TextAlign textAlign = TextAlign.left}) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );
  }

  static Axis setDirection(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return Axis.vertical;
    } else {
      return Axis.horizontal;
    }
  }
}
