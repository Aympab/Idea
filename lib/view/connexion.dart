import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/idea.dart';
import 'package:idea/view/inscription.dart';
import 'package:idea/tools/themes.dart';
import 'package:provider/provider.dart';

class ConnexionView extends StatefulWidget {
  ConnexionView({Key key}) : super(key: key);
  static String tag = 'connexion-page';

  @override
  _ConnexionViewState createState() => _ConnexionViewState();
}

class _ConnexionViewState extends State<ConnexionView> {
  Image ideaLogo = new Image.asset('assets/IdeaSurAmpoule.png');

  @override
  Widget build(BuildContext context) {
    FlatButton connexionButton = buildFlatButton("Connexion", onPressed: () {
      Navigator.of(context).pushNamed('/authentication');
    });

    FlatButton continueWithoutConnexionButton =
        buildFlatButton("Continuer \nsans \ns'inscrire", onPressed: () {
          Navigator.of(context).pushNamed('/ideaPage', arguments: Idea());
      // Navigator.of(context).pushNamed('/flux');
    });

    FlatButton inscriptionButton =
        buildFlatButton("Inscription", onPressed: () {
      Navigator.of(context).pushNamed('/inscription');
    });

    return SafeArea(
        child: Scaffold(
      //Pour essayer le changement de thème
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ThemeModel>(context, listen: false).toggleTheme();
        },
        child: Icon(Icons.color_lens),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new SizedBox(height: 32),
          new Row(
            children: <Widget>[
              new Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
                child: ideaLogo,
              )),
            ],
          ),
          new SizedBox(height: 40),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      connexionButton,
                      new SizedBox(width: 45),
                      continueWithoutConnexionButton,
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: new Row(
                      children: <Widget>[
                        inscriptionButton,
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }

  FlatButton buildFlatButton(String text, {Function onPressed}) {
    return FlatButton(
      color: Colors.yellow,
      // padding: EdgeInsets.fromLTRB(40, 25, 40, 25),
      onPressed: onPressed,
      child: SizedBox(
        height: 100,
        width: 100,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
