import 'dart:convert';

import 'package:callmemaybe/helpers.dart';
import 'package:callmemaybe/styles.dart';
import 'package:flutter/material.dart';
import 'package:callmemaybe/models/job_experience.dart';

class ExperienceList extends StatefulWidget {
  @override
  _ExperienceListState createState() => _ExperienceListState();
}

class _ExperienceListState extends State<ExperienceList> {
  var _experienceList;

  @override
  void initState() {
    super.initState();
    _experienceList = List<Widget>.of(
      [_resumeHeader()],
      growable: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_experienceList.length == 1) {
      DefaultAssetBundle.of(context)
          .loadString('lib/assets/data/job_data.json')
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

          if (this.mounted) {
            setState(() {
              _experienceList.addAll(newList);
            });
          }
        }
      });
    }

    return SingleChildScrollView(
      child: Column(
        children: _experienceList,
      ),
    );
  }

  _resumeHeader() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(Styles.lightGray)),
        ),
      ),
      child: Column(children: [
        Helpers.styledText(Helpers.fullName, Styles.headingSubBold),
        SizedBox(height: 12),
        Helpers.styledText(Helpers.email, Styles.textLarge),
        SizedBox(height: 12),
        Helpers.styledText(Helpers.phoneNumber, Styles.textLarge),
        SizedBox(height: 16)
      ]),
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
      padding: EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 4.0),
            child:
                Helpers.styledText(jobExperience.title, Styles.textLargeBold),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 4.0),
            child: Helpers.styledText(jobExperience.company, Styles.textLarge),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Helpers.styledText(
                    jobExperience.startDate + ' - ' + jobExperience.endDate,
                    Styles.textSubItalic),
                Helpers.styledText(
                    jobExperience.location, Styles.textSubItalic),
              ],
            ),
          ),
          Helpers.styledText(jobExperience.description, Styles.textBody),
        ],
      ),
    );
  }
}
