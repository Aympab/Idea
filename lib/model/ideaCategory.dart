import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class IdeaCategory {
  static List<Widget> listToCard(
      List<IdeaCategory> list, Color color1, Color color2) {
    List<CategoryCard> widgetList = List<CategoryCard>();

    bool altern = false;

    for (IdeaCategory category in list) {
      altern = !altern;

      altern
          ? widgetList.add(category.toCard(color1))
          : widgetList.add(category.toCard(color2));
    }

    return widgetList;
  }

  String name;

  //The number of idea using this category
  int popularity;

  IdeaCategory({this.name, this.popularity});

  CategoryCard toCard(Color color) => CategoryCard(
        color: color,
        name: name,
        popularity: popularity,
      );
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key key, this.color, this.name, this.popularity})
      : super(key: key);
  final Color color;
  final String name;
  final int popularity;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.elliptical(2, 3),
        ),
      ),
      elevation: 5,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(alignment: WrapAlignment.spaceEvenly, children: <Widget>[
          BorderedText(
            strokeWidth: 0.5,
            strokeColor: Colors.black,
            child: Text(
              '#',
              style:
                  TextStyle(fontWeight: FontWeight.w800, color: Colors.black87, fontSize:16),
            ),
          ),
          Text(
            name + '\n' + popularity.toString(),
            textAlign: TextAlign.center,
            style:
                  TextStyle(fontSize: 16),
          ),
        ]),
      ),
    );
  }
}
