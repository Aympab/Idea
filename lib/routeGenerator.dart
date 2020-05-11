import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/view/connexion.dart';
import 'package:idea/view/idea/ideaMainView.dart';
import 'package:idea/view/inscription.dart';
import 'package:idea/view/newIdea.dart';
import 'package:idea/view/profile/profileMain.dart';
import 'main.dart';
import 'model/idea.dart';
import 'model/user.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => ConnexionView());
        break;

      case '/inscription':
        return MaterialPageRoute(
          builder: (_) => InscriptionView(),
        );
        break;

      case '/userProfile':
        if (args is User) {
          return MaterialPageRoute(
              builder: (_) => InheritedProfile(user: args));
        } else {
          //TODO : Implement a nice error page (not in this file)
          return _errorPageBuilder();
        }
        break;

      case '/ideaPage':
        if (args is Idea) {
          return MaterialPageRoute(
              builder: (_) => InheritedIdea(
                    idea: args,
                  ));
        }
        break;

      case '/newIdeaPage':
        if (args is Idea) {
          return MaterialPageRoute(
              builder: (_) => NewIdeaView());
        }
        break;
        
      default:
        return _errorPageBuilder();
    }
  }

  static MaterialPageRoute _errorPageBuilder() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Routing error'),
        ),
        body: Center(
          child: Text(
              "Routing error.\nEither the route name is mispelled or the route isn't defined"),
        ),
      ),
    );
  }
}
