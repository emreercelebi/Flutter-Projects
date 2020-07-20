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
            Flex(
              direction: Helpers.setDirection(context),
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                profilePhoto(context),
                SizedBox(
                  width: 40.0,
                  height: 40.0
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Helpers.styledText(
                          Helpers.fullName, Styles.headingMain),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Helpers.styledText(Helpers.title, Styles.headingSub),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Helpers.styledText(Helpers.email, Styles.textSubItalic),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: phoneDisplay(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: websiteDisplay(),
                    ),
                  ],
                )
              ],
            ),
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

  Widget websiteDisplay() {
    return GestureDetector(
      child: Helpers.styledText(Helpers.websiteText, Styles.textLink),
      onTap: () => _launchURL(Helpers.website),
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
