import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/designs/userProfile.dart';
import 'package:idea/model/designs/userProfileRelated.dart';
import 'package:idea/model/user.dart';

class TestMain {
  static final User user = new User(
    infosOblig: new InformationsObligatoiresUser(
      pseudo: "pseudoDynamique",
      dateNaissance: DateTime.now(),
      email: 'emailDynamique',
      password: 'password',
    ),
    profileInfos: ProfileInformation(
      title: DefaultTitle('Idéateur novice'),
      level: Level(43),
    ),
  );
}


ThemeData darkTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.dark,
  primaryColor: Colors.amber[100],
  accentColor: Colors.blueGrey,
  //backgroundColor: Colors.blueGrey,
  appBarTheme: AppBarTheme(
    color: Colors.amberAccent,
    elevation: 1.0,
  ),

  iconTheme: IconThemeData(
    color: Colors.blueGrey,
  ),

  //sliderTheme: SliderThemeData(activeTrackColor:Colors.blueGrey,overlayColor: Colors.blueGrey ),

  

  // Define the default font family.
  //fontFamily: 'Georgia',

  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    title: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w300),
    body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
);