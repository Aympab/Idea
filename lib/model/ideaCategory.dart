import 'package:flutter/material.dart';
import 'package:idea/widget/categoryCard.dart';

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

