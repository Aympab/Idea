import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/view/welcomePages/signIn.dart';
import 'package:idea/view/welcomePages/connexion.dart';
import 'package:idea/view/flux/fluxMain.dart';
import 'package:idea/view/idea/ideaMainView.dart';
import 'package:idea/view/welcomePages/inscription.dart';
import 'package:idea/view/newIdea/newIdeaDifficulty.dart';
import 'package:idea/view/profile/profileMain.dart';
import 'package:idea/view/welcomePages/signUp.dart';
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
          builder: (_) => SignUpPage(),
        );
        break;

      case '/signIn':
        return MaterialPageRoute(
          builder: (_) => SignInPage(),
        );
        break;

      case '/userProfile':
        if (args is User) {
          return MaterialPageRoute(
              builder: (_) => InheritedProfile(user: args));
        } else {
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
        return MaterialPageRoute(builder: (_) => NewIdea());
        break;

      case '/flux':
        return MaterialPageRoute(builder: (_) => FluxMainView());

      default:
        return _errorPageBuilder();
    }

    return _errorPageBuilder();
  }

  static MaterialPageRoute _errorPageBuilder() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Routing error'),
        ),
        body: Center(
          child: Text(
              "Erreur.\nEuh, c'est un bug ça ? Redémarrez l'application, ça vaut mieux."),
        ),
      ),
    );
  }
}

void transitionPushToPage(BuildContext context, Widget child) {
  Navigator.push(
    context,
    PageRouteBuilder(
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        animation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInExpo,
        );

        return SlideTransition(
          child: child,
          position: Tween<Offset>(
            begin: Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secAnimation) {
        //The actual page
        return child;
      },
    ),
  );
}
