import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:idea/routeGenerator.dart';
import 'package:idea/tools/themes.dart';
import 'package:provider/provider.dart';

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
