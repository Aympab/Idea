import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/view/inscription.dart';

class ConnexionView extends StatefulWidget {
  ConnexionView({Key key}) : super(key: key);
  static String tag = 'connexion-page';

  @override
  _ConnexionViewState createState() => _ConnexionViewState();
}

class _ConnexionViewState extends State<ConnexionView>{

  Image ideaLogo = new Image.asset('assets/IdeaSurAmpoule.png');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    FlatButton connexionButton = new FlatButton(
      color: Colors.yellow,
      padding: EdgeInsets.all(40.0),
      onPressed: () {},
      child: new Text("Connexion",
        style: TextStyle(fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
      ),
    );

    FlatButton continueWithoutConnexionButton = new FlatButton(
      color: Colors.yellow,
      padding: EdgeInsets.fromLTRB(40, 25, 40, 25),
      onPressed: () {},
      child: new Text("Continuer \nsans \ns'inscrire",
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
    );

    FlatButton inscriptionButton = new FlatButton(
      color: Colors.yellow,
      padding: EdgeInsets.all(40.0),
      onPressed: () {

      },
      child: new Text("Inscription",
        style: TextStyle(fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
      ),
    );

    return new Scaffold(
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new SizedBox(height: 32),
          new Row(
            children: <Widget>[
              new Expanded(child: ideaLogo),
            ],
          ),
          new SizedBox(height: 64),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      connexionButton,
                      new SizedBox(width: 64),
                      continueWithoutConnexionButton,
                    ],
                  ),
                  new SizedBox(height : 64),
                  new Row(
                    children: <Widget>[
                      inscriptionButton,
                    ],
                  ),
                  new SizedBox(height: 16),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}