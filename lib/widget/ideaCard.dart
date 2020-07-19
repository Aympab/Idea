import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/idea.dart';
import 'package:idea/model/user.dart';
import 'package:idea/services/database.dart';
import 'package:provider/provider.dart';

class IdeaCard extends StatelessWidget {
  IdeaCard({Key key, this.idea}) : super(key: key);
  final Idea idea;

  final _logoPic = Image.asset('assets/logo.png');
  // final categories = IdeaCategory.listToCard(idea.categories, Colors.blue, Colors.yellow);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)),
      margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
      elevation: 10,
      child: Material(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(2),
          side: BorderSide(
            color: getBorderColorBasedOnDifficulty(idea),
            width: 0.5,
          ),
        ),
        color: getCardColorBasedOnDifficulty(idea),
        child: InkWell(
          borderRadius: BorderRadius.circular(2),
          splashColor: Color(0xFFC114).withOpacity(1.0),
          child: ListTile(
            // contentPadding: EdgeInsets.symmetric(horizontal: 2),
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: buildMainBody(),
            ),
            subtitle: buildBottom(),
          ),
          onTap: () {
            //When tapping on the card, we open idea's page
            print(idea.uid);
            Navigator.of(context).pushNamed(
              '/ideaPage',
              arguments: idea,
            );
          },
          onDoubleTap: () {
            DatabaseService().addSupportToIdea(
                idea, Provider.of<User>(context, listen: false));
          },
        ),
      ),
    );
  }

  Column buildBottom() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            idea.categories.length > 0
                ? Expanded(
                    child: Wrap(
                      children: List.generate(
                        idea.categories.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            idea.categories[index].name,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontFamily: 'BalsamiqSans',
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.only(left: 26.0),
              child:
                  //TODO : AYM - Implement a nice support square
                  Text(
                idea.supports.toString(),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Column buildMainBody() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Text(
                idea.title.toUpperCase(),
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'ChelseaMarket',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                idea.creator.pseudo,
                style: TextStyle(
                  fontFamily: 'BalsamiqSans',
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            idea.imageURL == null
                ? Container(height: 100, child: _logoPic)
                : Container(
                    height: 100,
                    child: CachedNetworkImage(
                      imageUrl: idea.imageURL,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  idea.shortDescription,
                  style: TextStyle(fontFamily: 'BalsamiqSans'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  getCardColorBasedOnDifficulty(Idea idea) {
    switch (idea.difficulty) {
      case (0):
        return Colors.amber[50];
        break;
      case (1):
        return Colors.green[50];
        break;
      case (2):
        return Colors.blue[50];
        break;
      case (3):
        return Colors.red[50];
        break;
      default:
        return Colors.white;
    }
  }

  getBorderColorBasedOnDifficulty(Idea idea) {
    switch (idea.difficulty) {
      case (0):
        return Colors.brown[300];
        break;
      case (1):
        return Colors.green[300];
        break;
      case (2):
        return Colors.blue[300];
        break;
      case (3):
        return Colors.red[300];
        break;
      default:
        return Colors.black45;
    }
  }
}
