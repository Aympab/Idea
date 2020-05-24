import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/idea.dart';
import 'package:idea/model/ideaCategory.dart';
import 'package:idea/widget/categoryCard.dart';

class IdeaCard extends StatelessWidget {
  IdeaCard({Key key, this.idea}) : super(key: key);
  final Idea idea;

  final _logoPic = Image.asset('assets/logo.png');
  // final categories = IdeaCategory.listToCard(idea.categories, Colors.blue, Colors.yellow);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(20, 13, 20, 0),
      elevation: 10,
      child: InkWell(
        onTap: () {},
        child: ListTile(
          // contentPadding: EdgeInsets.symmetric(horizontal: 2),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      idea.title,
                      style: TextStyle(
                        fontFamily: 'BalsamiqSans',
                        fontSize: 18,
                      ),
                    ),
                    Text(' DE ' + idea.creator.pseudo,),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    idea.imageURL == null
                        ? Container(height: 100, child: _logoPic)
                        : Container(
                            height: 100,
                            child: CachedNetworkImage(
                              imageUrl: idea.imageURL,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Text(idea.shortDescription)),
                  ],
                ),
              ],
            ),
          ),
          dense: false,
          subtitle: Column(
            children: <Widget>[],
          ),
          isThreeLine: true,
          // leading:
        ),
      ),
      // leading: ,//TODO : Image of the Idea
      // children: <Widget>[

      //   Text(idea.supports.toString()),
      //   Text(idea.creator.pseudo),
      // ],
    );
  }
}
// idea.categories.length > 1
//                   ? Row(
//                       children: <Widget>[
//                         Text(idea.categories[0].name),
//                         Text(idea.categories[1].name),

//                       ],
//                     )
//                   : Container(),
