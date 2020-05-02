import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/view/profile/profileHeader.dart';
import 'package:idea/view/profile/profileTabs.dart';

class ProfileView extends StatefulWidget {
  @override
  ProfileViewState createState() => ProfileViewState();
}

class ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          floating: false,
          pinned: true,
          snap: false,
          expandedHeight: 300.0,
          flexibleSpace: ProfileHeader()//FlexibleSpaceBar(title: Text('Demo'),),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('Grid Item $index'),
              );
            },
            childCount: 20,
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('List Item $index'),
              );
            },
          ),
        ),
      ],
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber[100],
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 40,
              child: ProfileHeader(),
            ),
            Expanded(
              flex: 60,
              child: ProfileTabs(),
            ),
          ],
        ),
      ),
    );
  }
}
