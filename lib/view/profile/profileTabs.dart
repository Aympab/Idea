import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'tabs/ideasTab.dart';
part 'tabs/infosTab.dart';
part 'tabs/resourcesTab.dart';
part 'tabs/summaryTab.dart';

class ProfileTabs extends StatefulWidget {
  static final List<Tab> tabs = _generateTabs();

  @override
  _ProfileTabsState createState() => _ProfileTabsState();

  static List<Tab> _generateTabs() {
    return <Tab>[
      Tab(
        text: 'Infos',
        icon: Icon(
          Icons.info,
          color: Colors.amber,
        ),
      ),
      Tab(
        text: 'Idées',
        icon: Icon(
          Icons.lightbulb_outline,
          color: Colors.amber,
        ),
      ),
      Tab(
        text: 'Récap',
        icon: Icon(
          Icons.graphic_eq,
          color: Colors.amber,
        ),
      ),
      Tab(
        text: 'Ressources',
        icon: Icon(
          Icons.blur_on,
          color: Colors.amber,
        ),
      ),
    ];
  }
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
          children: <Widget>[
            InfosTab(),
            IdeasTab(),
            SummaryTab(),
            ResourcesTab(),          
          ],
          // ProfileTabs.tabs.map((Tab tab) {
          //   final String label = tab.text.toLowerCase();
          //   return Center(
          //     child: Text(
          //       'This is the $label tab',
          //       style: const TextStyle(fontSize: 36),
          //     ),
          //   );
          // }).toList(),
        ),
      ),
    );
  }
}
