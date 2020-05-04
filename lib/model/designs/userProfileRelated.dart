import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Le level du user, peut faire des classes filles pour avoir un propre style
class Level {
  final int level;
  final TextStyle style = TextStyle(color: Colors.red, fontSize: 30);

  Level(this.level);

  //TODO : Implement multiple with different style depending on the level (in the constructor, if level > 12, etc)
  //Level(this.level, this.style);

  //Pour récupérer juste le level en format string dans les affichage
  @override
  String toString() {
    return '$level';
  }
}

//Une classe pour les titres des users, abstaite, on instancie les classes filles qui ont des styles prédéfinis
abstract class UserTitle {
  static double fontSize = 25;

  final String title;
  final TextStyle style;

  UserTitle(this.title, this.style);

  //Return a pretty text with outile using the bordered_text package
  BorderedText toPrettyText();
}

//Les titres par défaut
class DefaultTitle extends UserTitle {
  DefaultTitle(String titleString) : super(titleString, _defaultStyle);

  //En gras en vert fluo
  static TextStyle _defaultStyle = new TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.bold,
    fontSize: UserTitle.fontSize,
    fontFamily: 'IndieFlower'
  );

  @override
  String toString() {
    return this.title;
  }

  @override
  BorderedText toPrettyText() {
    return BorderedText(
      strokeWidth: 3.0,
      strokeColor: Colors.black,
      child: Text(
        this.toString(),
        style: _defaultStyle,
      ),
    );
  }
}
