import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idea/view/inscription.dart';
import 'package:idea/view/profile/profileMain.dart';

import 'view/inscription.dart';
import 'bloc/inscription/inscription_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      title: 'Idea',
      home: BlocProvider(
        create: (BuildContext context) => InscriptionBloc(),
        child: ProfileView(),
      ),
    );
  }
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


  tabBarTheme: TabBarTheme(
    labelColor: Colors.blue[600],
    unselectedLabelColor: Colors.blue[900],
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        width: 5.0,
        color: Colors.blue[600],
      ),
    ),
  ),


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
