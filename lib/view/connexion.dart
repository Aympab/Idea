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

  //final Image imageTitle = Image.asset('assets/IdeaTitle.png');

  @override
  _ConnexionViewState createState() => _ConnexionViewState();
}

class _ConnexionViewState extends State<ConnexionView> {
  //TODO : Change with an animted GIF
  Image ideaBulbLogo = new Image.asset('assets/images/mainLightBulbLogo.png');

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
        text: 'Connexion',
        onTapUp: () {
          Navigator.of(context).pushNamed('/authenticationPage');
        }); //buildFlatButton("Connexion");

    Widget continueWithoutConnexionButton = PostItButton(
      text: "Continuer sans se connecter",
      onTapUp: () {
        Navigator.of(context).pushNamed('/ideaPage', arguments: Idea());
      },
    );

    Widget inscriptionButton = // PostItButton(text: 'text', onTapUp: () {});
        LongPostItButton(text: 'Inscription', onTapUp: () {});

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFFC114).withOpacity(1.0),
              Color(0xF8EABF).withOpacity(1.0),
            ]),
      ),
      child: Scaffold(
        floatingActionButton: IconButton(
          onPressed: () {
          },
          icon: Icon(Icons.navigate_next),
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height / 2.8),
                    child: ideaBulbLogo),
                builTitleIdea(),
                Text(
                  'Donnez vie a vos idees!',
                  style: TextStyle(
                    fontFamily: "Nanum",
                    fontSize: 23,
                    color: Color(0xff333232),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // buildCoolButton() {
  //   return ConstrainedBox(
  //     constraints: BoxConstraints(
  //       maxHeight: 120,
  //       maxWidth: 120,
  //     ),
  //     child: Container(
  //       child: ConstrainedBox(
  //         constraints: BoxConstraints.expand(),
  //         child: Ink.image(
  //           image: AssetImage(
  //               'assets/images/buttonsImages/postItLeftCornerUp.png'),
  //           fit: BoxFit.fill,
  //           child: InkWell(
  //             splashColor: Colors.amber,
  //             enableFeedback: false,
  //             onTap: () {
  //               AudioCache player = new AudioCache();
  //               const alarmAudioPath = "sounds/tapOnPaper.mp3";
  //               player.play(alarmAudioPath);
  //               print('tap');
  //             },
  //             // onTapDown: (){},
  //             // onTapCancel: ,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  builTitleIdea() {
    return Text('Idea',
        style: TextStyle(
          fontFamily: "Nanum",
          fontSize: 200,
          color: Color(0xfff8e8ba),
          shadows: [
            Shadow(
              offset: Offset(0.00, 5.00),
              color: Color(0xff000000).withOpacity(0.68),
              blurRadius: 6,
            ),
          ],
        ));
  }
}

