import 'package:callmemaybe/experience_list.dart';
import 'package:flutter/material.dart';

class ResumeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ExperienceList(),
    );
  }
}