import 'package:flutter/material.dart';
import 'Tabs/business_card_tab.dart';
import 'Tabs/resume_tab.dart';
import 'Tabs/predictor_tab.dart';

class TabScreen extends StatelessWidget {
  final List<Tab> tabs = <Tab>[
    Tab(
      icon: Icon(Icons.person),
    ),
    Tab(
      icon: Icon(Icons.work),
    ),
    Tab(
      icon: Icon(Icons.help_outline),
    ),
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
