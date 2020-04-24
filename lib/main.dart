import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:idea/routeGenerator.dart';
import 'package:idea/tools/themes.dart';
import 'package:idea/view/connexion.dart';
import 'package:idea/view/idea/ideaMainView.dart';
import 'package:idea/view/inscription.dart';
import 'package:idea/view/profile/profileMain.dart';
import 'package:provider/provider.dart';

import 'launchingAppTest.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (BuildContext context) => ThemeModel(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeModel>(context).currentTheme,
      title: 'Idea',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      // home: InheritedIdea(
      //   child: IdeaView(),
      // ),
    );
  }
}
