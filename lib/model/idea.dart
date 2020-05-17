import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/user.dart';

import 'ideaCategory.dart';

class Idea {
  final String uid;
  String title;
  Image mainPicture;
  String shortDescription;
  List<IdeaCategory> categories;
  User creator;
  int supports;
  int advancement;

  Idea({
    this.uid,
    this.title,
    this.creator,
    this.mainPicture,
    this.shortDescription,
    this.advancement,
    this.categories,
    this.supports,
  });

  int addSupport() {
    this.supports++;
    return this.supports;
  }

}

//TODO : Rendre propre et mettre dans le répertor Widget
class IdeaCard extends StatelessWidget {
  const IdeaCard({Key key, this.idea}) : super(key: key);
  final Idea idea;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        elevation: 10,
        child: ListTile(
          title: Text(idea.title),
          subtitle: Text(idea.shortDescription + ' DE ' + idea.creator.pseudo),
          // leading: ,//TODO : Image of the Idea
          // children: <Widget>[
            
            
          //   Text(idea.supports.toString()),
          //   Text(idea.creator.pseudo),
          // ],
        ),
      ),
    );
  }
}
