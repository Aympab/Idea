import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/idea.dart';
import 'package:idea/widget/userCard.dart';

import '../../launchingAppTest.dart';

class InheritedIdea extends InheritedWidget {
  InheritedIdea({this.idea, Key key, this.child})
      : super(key: key, child: child);

  final Widget child;

  final Idea idea;

  static InheritedIdea of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<InheritedIdea>());
  }

  @override
  bool updateShouldNotify(InheritedIdea oldWidget) {
    return true;
  }
}

class IdeaView extends StatelessWidget {
  const IdeaView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    //TODO : Dynamise
                    'Fusée à roulette',
                    style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    //TODO : Dynamise
                    "Une fusée ambidextre qui peut rouler sur l'eau et voler dans l'espace",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Jost',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width - 50,
                          maxHeight: 250),
                      child: Image.network(
                          //TODO : Dynamise and add border, maybe resize as well
                          "https://previews.123rf.com/images/upixel123/upixel1231606/upixel123160600054/59803306-collez-figure-avec-une-fus%C3%A9e-sur-son-dos-et-patins-%C3%A0-roulettes.jpg"),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Text(
                          'Par',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      UserCard(user: TestMain.user),
                    ],
                  ),
                  _buildExpansionTileDescription(),
                  _buildExpansionTileBesoins(),
                  _buildExpansionTileParticipants(),
                  _buildExpansionTilePlusInfos(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: buildColumnIcons(context),
            ),
          ],
        ),
      ),
    );
  }

  ConstrainedBox buildColumnIcons(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: (MediaQuery.of(context).size.height / 5) >= 144
            ? (MediaQuery.of(context).size.height / 5)
            : 144,
        //Under 144 px, there is a pixel overflow
        minHeight: 144,
        maxWidth: 50,
      ),
      child: Column(
        children: <Widget>[
          OutlineButton(
            onPressed: () {},
            child: Icon(Icons.info_outline),
          ),
          OutlineButton(
            onPressed: () {},
            child: Icon(Icons.public),
          ),
          OutlineButton(
            onPressed: () {},
            child: Icon(Icons.message),
          ),
        ],
      ),
    );
  }

  Text _buildTileTitle(String title) => Text(
        title,
        textAlign: TextAlign.center,
      );

  _buildExpansionTileDescription() {
    return ExpansionTile(
      title: _buildTileTitle('Description détaillée'),
      children: <Widget>[
        Container(
          color: Colors.amber,
          child: SizedBox(height: 100, width: 100),
        ),
      ],
    );
  }

  _buildExpansionTileBesoins() {
    return ExpansionTile(
      title: _buildTileTitle('Besoins'),
      children: <Widget>[],
    );
  }

  _buildExpansionTileParticipants() {
    return ExpansionTile(
      title: _buildTileTitle('Participants'),
      children: <Widget>[],
    );
  }

  _buildExpansionTilePlusInfos() {
    return ExpansionTile(
      title: _buildTileTitle("Plus d'infos"),
      children: <Widget>[],
    );
  }
}
