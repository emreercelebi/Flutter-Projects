import 'package:flutter/material.dart';

class BusinessCardTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            profilePhoto(context),
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
}
