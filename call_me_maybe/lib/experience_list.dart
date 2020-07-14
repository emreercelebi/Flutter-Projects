import 'dart:convert';

import 'package:callmemaybe/helpers.dart';
import 'package:callmemaybe/styles.dart';
import 'package:flutter/material.dart';
import 'package:callmemaybe/job_experience.dart';

class ExperienceList extends StatefulWidget {
  @override
  _ExperienceListState createState() => _ExperienceListState();
}

class _ExperienceListState extends State<ExperienceList> {
  var _experienceList = new List<Widget>();

  @override
  Widget build(BuildContext context) {
    DefaultAssetBundle.of(context)
        .loadString('assets/data/job_data.json')
        .then((value) {
      final jsonData = json.decode(value);
      final jobs = jsonData['jobs'];
      if (jobs is List<dynamic> && jobs.length > 0) {
        final newList = jobs
            .map((job) => JobExperienceItem(
                  jobExperience: JobExperience(
                      title: job['title'],
                      company: job['company'],
                      startDate: job['startDate'],
                      endDate: job['endDate'],
                      location: job['location'],
                      description: job['description']),
                ))
            .toList();

        setState(() {
          _experienceList = newList;
        });
      }
    });

    return SingleChildScrollView(
      child: Column(
        children: _experienceList,
      ),
    );
  }
}

class JobExperienceItem extends StatelessWidget {
  final JobExperience jobExperience;

  JobExperienceItem({
    Key key,
    this.jobExperience,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Helpers.styledText(jobExperience.title, Styles.textLargeBold),
          Helpers.styledText(jobExperience.company, Styles.textLarge),
          Row(
            children: [
              Helpers.styledText(
                  jobExperience.startDate + ' - ' + jobExperience.endDate,
                  Styles.textSubItalic),
              Helpers.styledText(jobExperience.location, Styles.textSubItalic),
            ],
          ),
          Helpers.styledText(jobExperience.description, Styles.textBody),
        ],
      ),
    );
  }
}
