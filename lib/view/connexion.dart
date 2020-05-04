import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/view/inscription.dart';

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
    // TODO: implement build

    FlatButton connexionButton = buildFlatButton("Connexion");

    FlatButton continueWithoutConnexionButton =
        buildFlatButton("Continuer \nsans \ns'inscrire");

    FlatButton inscriptionButton = buildFlatButton("Inscription");

    return Scaffold(
      body: SafeArea(
        child: Column(
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
      ),
    );
  }

  FlatButton buildFlatButton(String text) {
    return FlatButton(
      color: Colors.yellow,
      // padding: EdgeInsets.fromLTRB(40, 25, 40, 25),
      onPressed: () {},
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
