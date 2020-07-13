import 'package:flutter/material.dart';

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
          bottom: TabBar(
            tabs: tabs,
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text('1'),
            ),
            Center(
              child: Text('2'),
            ),
            Center(
              child: Text('3'),
            ),
          ],
        ),
      ),
    );
  }
}
