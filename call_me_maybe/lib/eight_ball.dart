import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:callmemaybe/helpers.dart';
import 'package:callmemaybe/styles.dart';

class EightBall extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EightBallState();
}

class _EightBallState extends State<EightBall> {
  final Random _random = Random();
  final options = [
    'Don\'t count on it',
    'It is certain',
    'It is decidedly so',
    'My sources say no',
    'Outlook not so good',
    'Reply hazy, try again',
    'Very doubtful',
    'Heck yeah'
  ];

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
      child: Column(children: [
        Helpers.styledText(Helpers.predictorHeading, Styles.headingMain),
        Flex(
          direction: Helpers.setDirection(context),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Helpers.styledText(
                  Helpers.predictorPrompt,
                  Styles.headingSub,
                  textAlign: TextAlign.center,
                ),
              ),
              onTap: _shuffleIndex,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Helpers.styledText(
                  options[_currentIndex], Styles.headingMain),
            )
          ],
        )
      ]),
    );
  }

  void _shuffleIndex() {
    setState(() {
      _currentIndex = _random.nextInt(options.length);
    });
  }
}
