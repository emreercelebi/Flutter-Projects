import 'package:flutter/material.dart';
import 'Tabs/business_card_tab.dart';
import 'Tabs/resume_tab.dart';
import 'Tabs/predictor_tab.dart';

class TabScreen extends StatelessWidget {
  final List<Tab> tabs = <Tab>[
    Tab(text: '1'),
    Tab(text: '2'),
    Tab(text: '3'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Call Me Maybe'),
          ),
          bottom: TabBar(
            tabs: tabs,
          ),
        ),
        body: TabBarView(
          children: [
            BusinessCardTab(),
            ResumeTab(),
            PredictorTab(),
          ],
        ),
      ),
    );
  }
}
