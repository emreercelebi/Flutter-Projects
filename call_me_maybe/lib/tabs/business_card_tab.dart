import 'package:flutter/material.dart';
import 'package:callmemaybe/styles.dart';
import 'package:callmemaybe/helpers.dart';
import 'package:url_launcher/url_launcher.dart';

class BusinessCardTab extends StatelessWidget {
  final fullName = 'Emre Ercelebi';
  final title = 'Software Engineer';
  final phoneNumber = '(804) 555-1234';
  final phoneDigits = '8045551234';
  final website =
      'https://media1.giphy.com/media/UTLjndqhYc1qlYmNwa/giphy.gif?cid=ecf05e47157c3f5a8ee55a62d6eafe0031aceff0df015431&rid=giphy.gif';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            profilePhoto(context),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Helpers.styledText(fullName, Styles.headingMain),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Helpers.styledText(title, Styles.headingSub),
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
        backgroundImage: AssetImage('assets/images/profile_photo.PNG'),
      ),
    );
  }

  Widget websiteButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 24.0, 0, 0),
      child: RaisedButton(
        onPressed: () => _launchURL(website),
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
      child: Helpers.styledText(phoneNumber, Styles.textLink),
      onTap: () => _launchURL('sms:' + phoneDigits),
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
