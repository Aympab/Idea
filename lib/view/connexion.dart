import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/idea.dart';
import 'package:idea/routeGenerator.dart';
import 'package:idea/view/inscription.dart';
import 'package:idea/tools/themes.dart';
import 'package:provider/provider.dart';
import 'package:idea/widget/longPostItButton.dart';
import 'package:idea/widget/postItButton.dart';

class ConnexionView extends StatefulWidget {
  ConnexionView({Key key}) : super(key: key);
  static String tag = 'connexion-page';

  final Image imageTitle = Image.asset('assets/IdeaTitle.png');

  @override
  _ConnexionViewState createState() => _ConnexionViewState();
}

class _ConnexionViewState extends State<ConnexionView> {
  //TODO : Change with an animted GIF
  Image ideaBulbLogo = new Image.asset('assets/IdeaLightBulb.png');

//TODO :change image Title definition and precache it
// //To precache image so it charges everything before displaying the screen
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     precacheImage(_upPic, context);
//     precacheImage(_downPic, context);
//     precacheImage(_downPic, context);
//   }

  @override
  Widget build(BuildContext context) {
    Widget connexionButton = PostItButton(
        text: 'Connexion', onTapUp: () {
          Navigator.of(context).pushNamed('/authenticationPage');
        }); //buildFlatButton("Connexion");

    Widget continueWithoutConnexionButton = PostItButton(
      text: "Continuer sans se connecter",
      onTapUp: () {
        Navigator.of(context).pushNamed('/ideaPage', arguments:Idea());
      },
    );

    Widget inscriptionButton = // PostItButton(text: 'text', onTapUp: () {});
        LongPostItButton(
            text: 'Inscription',
            onTapUp: () {
              Navigator.of(context).pushNamed('/inscription');
            });

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ThemeModel>(context, listen: false).toggleTheme();
        },
        child: Icon(Icons.color_lens),
      ),
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
              child: widget.imageTitle,
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
                        SizedBox(width: 50),
                        continueWithoutConnexionButton
                      ],
                    ),
                    SizedBox(height: 16),
                    inscriptionButton
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
            image: AssetImage(
                'assets/images/buttonsImages/postItLeftCornerUp.png'),
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

  FlatButton buildFlatButton(String text, Function onPressed) {
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
