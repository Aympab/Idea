import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/widget/longPostItButton.dart';
import 'package:idea/widget/postItButton.dart';

class ConnexionView extends StatefulWidget {
  ConnexionView({Key key}) : super(key: key);
  static String tag = 'connexion-page';

  @override
  _ConnexionViewState createState() => _ConnexionViewState();
}

class _ConnexionViewState extends State<ConnexionView> {
  //TODO : Change with an animted GIF
  Image ideaBulbLogo = new Image.asset('assets/IdeaLightBulb.png');

  @override
  Widget build(BuildContext context) {
    Widget connexionButton = PostItButton(text: 'Connexion', onTapUp: (){});//buildFlatButton("Connexion");

    Widget continueWithoutConnexionButton = PostItButton(text: "Continuer sans se connecter", onTapUp: (){},);
    // buildFlatButton("Continuer \nsans \ns'inscrire");

    Widget inscriptionButton = LongPostItButton(text: 'Inscription', onTapUp: (){});

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 5),
              child: Image.asset('assets/IdeaTitle.png'),
            ),
            new SizedBox(height: 20),
            ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height / 4),
                child: ideaBulbLogo),
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

  buildCoolButton() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 120,
        maxWidth: 120,
      ),
      child: Container(
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Ink.image(
            image: AssetImage('assets/images/buttonsImages/postItLeftCornerUp.png'),
            fit: BoxFit.fill,
            child: InkWell(
              splashColor: Colors.amber,
              enableFeedback: false,
              onTap: () {
                AudioCache player = new AudioCache();
                const alarmAudioPath = "sounds/tapOnPaper.mp3";
                player.play(alarmAudioPath);
                print('tap');
              },
              // onTapDown: (){},
              // onTapCancel: ,
            ),
          ),
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


