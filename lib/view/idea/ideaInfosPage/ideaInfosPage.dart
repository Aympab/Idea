import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:idea/model/user.dart';
import 'package:idea/services/database.dart';
import 'package:idea/view/idea/ideaMainView.dart';
import 'package:idea/widget/userCard.dart';

import '../../../launchingAppTest.dart';

class IdeaInfosPage extends StatefulWidget {
  IdeaInfosPage({
    Key key,
  }) : super(key: key);

  @override
  _IdeaInfosPageState createState() => _IdeaInfosPageState();
}

class _IdeaInfosPageState extends State<IdeaInfosPage> {
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
            child: InheritedIdea.of(context).idea.imageURL != null
                ? Image.network(
                    //TODO : Beautify
                    InheritedIdea.of(context).idea.imageURL)
                : //TODO : Display a default image
                SizedBox(height: 100),
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
            InheritedIdea.of(context).idea.creator.pseudo == 'Anonyme'
                ? Card(
                    //TODO : Sweet anonymous card
                    child: Text("ANONYME"),
                  )
                : UserCard(user: InheritedIdea.of(context).idea.creator),
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
