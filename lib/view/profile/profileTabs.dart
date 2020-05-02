import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileTabs extends StatefulWidget {

  static final List<Tab> tabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];

  @override
  _ProfileTabsState createState() => _ProfileTabsState();
}

class _ProfileTabsState extends State<ProfileTabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: ProfileTabs.tabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: ProfileTabs.tabs,
          ),
        ),
        body: TabBarView(
          children: ProfileTabs.tabs.map((Tab tab) {
            final String label = tab.text.toLowerCase();
            return Center(
              child: Text(
                'This is the $label tab',
                style: const TextStyle(fontSize: 36),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
