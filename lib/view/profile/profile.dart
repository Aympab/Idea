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
        _buildAppBar(),
        _buildSilverGridTabs(),

        // SliverFixedExtentList(
        //   itemExtent: 50.0,
        //   delegate: SliverChildBuilderDelegate(
        //     (BuildContext context, int index) {
        //       return Container(
        //         alignment: Alignment.center,
        //         color: Colors.lightBlue[100 * (index % 9)],
        //         child: Text('List Item $index'),
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }

  Widget _buildAppBar() {
    return const SliverAppBar(
        floating: false,
        pinned: true,
        snap: false,
        expandedHeight: 300.0,
        flexibleSpace: ProfileHeader() //FlexibleSpaceBar(title: Text('Demo'),),
        );
  }

  Widget _buildIconButton(IconData icon, String text, Function onPressedFunc) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(icon),
              onPressed: () {
                print('Tapped');
              },
              //onPressed: onPressedFunc,
            ),
            Text('$text')
          ],
        ),
      ),
    );
  }

  _buildSilverGridTabs() {
    final List<Widget> _buttonsTab = [
      _buildIconButton(Icons.info, 'Infos', () {}),
      _buildIconButton(Icons.lightbulb_outline, 'Idées', () {}),
      _buildIconButton(Icons.graphic_eq, 'Récap', () {}),
      _buildIconButton(Icons.bubble_chart, 'Ressources', () {}),
    ];

    return SliverGrid(
      delegate: SliverChildListDelegate(
        _buttonsTab,
      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1.0,
      ),
    );
  }
}

// SliverChildBuilderDelegate(
//         (BuildContext context, int index) {
//           return Container(
//             alignment: Alignment.center,
//             color: Colors.teal[100 * (index % 9)],
//             child: Text('Grid Item $index'),
//           );
//         },
//         childCount: 4,
//       ),
