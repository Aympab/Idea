import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Le level du user, peut faire des classes filles pour avoir un propre style
class Level {
  final int level;
  final TextStyle style =
      TextStyle(color: Colors.red, fontSize: 40, fontWeight: FontWeight.bold);

  Level(this.level);

  //TODO : Implement different style depending on the level (in the constructor, if level > 12, etc)
  //Il faut mettre dans le constructeur un if(this.leve > 12), on met une couleur, sinon une autre, etc, genre marron clair vert bleu rouge 
  //on peut garder lescouleurs des difficultés des idées
  BorderedText toPrettyText() {
    return BorderedText(
      strokeWidth: 2,
      child: Text(
        this.toString(),
        style: style,
      ),
    );
  }

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
  Widget toPrettyText();
}

//Les titres par défaut
class DefaultTitle extends UserTitle {
  DefaultTitle(String titleString) : super(titleString, _defaultStyle);

  //En gras en vert fluo
  static TextStyle _defaultStyle = new TextStyle(
    color: Colors.green,
    //fontWeight: FontWeight.bold,
    fontSize: UserTitle.fontSize,
    fontFamily: 'Jost',
    fontWeight: FontWeight.bold,
  );

  @override
  String toString() {
    return this.title;
  }

  @override
  Widget toPrettyText() {
    return Text(
      this.toString(),
      style: _defaultStyle,
    );
  }
}
