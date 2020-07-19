import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:idea/view/idea/ideaMainView.dart';
import 'package:idea/widget/userCard.dart';

import '../../../launchingAppTest.dart';

class IdeaInfosPage extends StatelessWidget {
  const IdeaInfosPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Center(
              child: Text(
            InheritedIdea.of(context).idea.title,
            style: TextStyle(
                fontSize: 40, fontFamily: 'Jost', fontWeight: FontWeight.bold),
          )),
        ),
        Container(
          child: Center(
            child: Text(
              InheritedIdea.of(context).idea.shortDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontFamily: 'Jost',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
        Container(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 50,
                maxHeight: 250),
            child: Image.network(
              InheritedIdea.of(context).idea.imageURL,
              //TODO : Dynamise and add border, maybe resize as well
              //"https://previews.123rf.com/images/upixel123/upixel1231606/upixel123160600054/59803306-collez-figure-avec-une-fus%C3%A9e-sur-son-dos-et-patins-%C3%A0-roulettes.jpg"),
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                'Par :',
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
              ),
            ),
            //TODO : Dynamise
            UserCard(user: TestMain.user),
          ],
        ),
        _buildExpansionTileDescription(),
        _buildExpansionTileBesoins(),
        _buildExpansionTileParticipants(),
        _buildExpansionTilePlusInfos(),
      ],
    );
  }

  Text _buildTileTitle(String title) => Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontSize: 20),
      );

  _buildExpansionTileDescription() {
    return ExpansionTile(
      initiallyExpanded: true,
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
