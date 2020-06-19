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
        ),
      ),
      Tab(
        text: 'Idées',
        icon: Icon(
          Icons.lightbulb_outline,
        ),
      ),
      Tab(
        text: 'Récap',
        icon: Icon(
          Icons.graphic_eq,
        ),
      ),
      Tab(
        text: 'Skills',
        icon: Icon(
          Icons.blur_on,
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
        appBar: new PreferredSize(
            child: new Container(
              color: Colors.amberAccent,
              child: Column(
                children: <Widget>[
                  new Expanded(child: new Container()),
                  new TabBar(tabs: ProfileTabs.tabs)
                ],
              ),
            ),
            preferredSize: Size.fromHeight(kToolbarHeight)),
        //  AppBar(
        //   elevation: 15.0,
        //   titleSpacing: 0.0,
        //   bottom: TabBar(
        //     tabs: ProfileTabs.tabs,
        //   ),
        // ),
        body: TabBarView(
          children: <Widget>[
            InfosTab(),
            IdeasTab(),
            SummaryTab(),
            ResourcesTab(),
          ],
        ),
      ),
    );
  }
}
