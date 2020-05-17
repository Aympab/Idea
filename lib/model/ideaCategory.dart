import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:idea/view/newIdea/secondPossiblePages/easyIdea.dart';

class IdeaCategory {
  static List<Widget> listToCard(
      List<IdeaCategory> list, Color color1, Color color2, {GlobalKey gridKey}) {
    List<CategoryCard> widgetList = List<CategoryCard>();

    bool altern = false;

    for (IdeaCategory category in list) {
      altern = !altern;

      altern
          ? widgetList.add(category.toCard(color1,gridKey: gridKey))
          : widgetList.add(category.toCard(color2,gridKey: gridKey));
    }

    return widgetList;
  }

  String name;

  //The number of idea using this category
  int popularity;

  IdeaCategory({this.name, this.popularity});

  CategoryCard toCard(Color color, {GlobalKey gridKey}) => CategoryCard(
        color: color,
        name: name,
        popularity: popularity,
        gridKey: gridKey,
      );
}

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {Key key, this.color, this.name, this.popularity, this.gridKey})
      : super(key: key);
  final Color color;
  final String name;
  final int popularity;

  final GlobalKey<SelectedCategoriesGridState> gridKey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {
        //TODO : Double tap to remove category
          gridKey.currentState.removeCategory(cardAsCategory());
      },
      child: Card(
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
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                    fontSize: 16),
              ),
            ),
            Text(
              name + '\n' + popularity.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ]),
        ),
      ),
    );
  }

  IdeaCategory cardAsCategory() {
    return IdeaCategory(name: this.name, popularity: this.popularity);
  }
}
