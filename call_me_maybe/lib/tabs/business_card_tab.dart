import 'package:flutter/material.dart';
import 'package:callmemaybe/styles.dart';
import 'package:callmemaybe/helpers.dart';
import 'package:url_launcher/url_launcher.dart';

class BusinessCardTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            profilePhoto(context),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Helpers.styledText(Helpers.fullName, Styles.headingMain),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Helpers.styledText(Helpers.title, Styles.headingSub),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: phoneDisplay(),
            ),
            websiteButton(),
          ],
        ),
      ),
    );
  }

  Widget profilePhoto(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 200.0,
      ),
      child: CircleAvatar(
        radius: 100,
        backgroundImage: AssetImage('lib/assets/images/profile_photo.PNG'),
      ),
    );
  }

  Widget websiteButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 24.0, 0, 0),
      child: RaisedButton(
        onPressed: () => _launchURL(Helpers.website),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Helpers.styledText('Never Forget', Styles.textLarge),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
              child: Icon(
                Icons.open_in_browser,
                size: 24.0,
                color: Color(Styles.lightGray),
              ),
            ),
          ],
        ),
        color: Color(Styles.orangeSecondary),
      ),
    );
  }

  Widget phoneDisplay() {
    return GestureDetector(
      child: Helpers.styledText(Helpers.phoneNumber, Styles.textLink),
      onTap: () => _launchURL('sms:' + Helpers.phoneDigits),
    );
  }

  void _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
