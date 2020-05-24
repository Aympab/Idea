import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/ideaCategory.dart';
import 'package:idea/view/newIdea/secondPossiblePages/widgetThirdPage.dart';

class CategoryCard extends StatelessWidget {
  factory CategoryCard.category(IdeaCategory category, Color color) {
    return CategoryCard(
      name: category.name,
      popularity: category.popularity,
      color: color,
    );
  }

  const CategoryCard(
      {Key key, this.color, this.name, this.popularity, this.gridKey})
      : super(key: key);
  final Color color;
  final String name;
  final int popularity;

  //TODO : Check if currently affected to a grid
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
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.8),
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                  fontFamily: 'BalsamiqSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                '(${popularity.toString()})',
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'BalsamiqSans',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  IdeaCategory cardAsCategory() {
    return IdeaCategory(name: this.name, popularity: this.popularity);
  }
}
