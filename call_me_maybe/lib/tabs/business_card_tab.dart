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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(1000.0),
        child: Image.asset(
          'assets/images/profile_photo.PNG',
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.width * 0.5
        ),
      ),
    );
  }
}
