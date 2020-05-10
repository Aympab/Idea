import 'dart:math';

import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/idea.dart';
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
  Image ideaLogo = new Image.asset('assets/images/mainLightBulbLogo.png');

//TODO :change image Title definition and precache it
// //To precache image so it charges everything before displaying the screen
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     precacheImage(_upPic, context);
//     precacheImage(_downPic, context);
//     precacheImage(_downPic, context);
//   }

  bool _changingPage = true;

  @override
  Widget build(BuildContext context) {
    Widget connexionButton = PaperButton(
        text: 'Connexion',
        onTapUp: () {
          Navigator.of(context).pushNamed('/authenticationPage');
        }); //buildFlatButton("Connexion");

    Widget continueWithoutConnexionButton = PaperButton(
      text: "Continuer sans se connecter",
      onTapUp: () {
        Navigator.of(context).pushNamed('/ideaPage', arguments: Idea());
      },
    );

    Widget inscriptionButton = // PostItButton(text: 'text', onTapUp: () {});
        LongPostItButton(
      text: 'Creer un compte',
      color: LPColors.blue,
      onTapUp: () {
        Navigator.of(context).pushNamed('/inscription');
      },
    );

    double topPosLogo = -50;
    double topPosPostit = topPosLogo + MediaQuery.of(context).size.height/1.8;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color(0xFFC114).withOpacity(1.0),
            Color(0xF8EABF).withOpacity(1.0),
          ],
        ),
      ),
      child: Scaffold(
        floatingActionButton: IconButton(
          onPressed: () {
            setState(() {
              _changingPage = !_changingPage;
            });
          },
          icon: Icon(Icons.navigate_next),
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: AnimatedCrossFade(
            crossFadeState: _changingPage
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: Duration(seconds: 2),
            firstChild: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: FirstPageConnexion(
                ideaBulbLogo: ideaLogo,
              ),
            ),
            secondChild: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: topPosLogo,
                    left: -50,
                    height: 280,
                    child: Transform.rotate(angle: 2.4, child: ideaLogo),
                  ),
                  Positioned(
                    top: topPosPostit,
                    left: 40,
                    child: continueWithoutConnexionButton,
                  ),
                  Positioned(
                    top: topPosPostit,
                    right: 40,
                    child: connexionButton,
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height/15,
                    left: 40,
                    child: inscriptionButton,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FirstPageConnexion extends StatefulWidget {
  final Image ideaBulbLogo;
  const FirstPageConnexion({
    Key key,
    @required this.ideaBulbLogo,
  }) : super(key: key);

  @override
  _FirstPageConnexionState createState() => _FirstPageConnexionState();
}

class _FirstPageConnexionState extends State<FirstPageConnexion> {
  //double _screenHeight;
  double _screenWidth; //MediaQuery.of(context).size.width;

  double _logoTopPos;
  double _logoRightPos;

  double _titleTopPos;
  double _titleRightPos;

  double _subTitleTopPos;
  double _subTitleRightPos;

  @override
  Widget build(BuildContext context) {
    //_screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;
    _logoTopPos = 60;
    _logoRightPos = _screenWidth / 6;

    _titleTopPos = _logoTopPos + 250;
    _titleRightPos = _screenWidth / 6;

    _subTitleTopPos = _titleTopPos + 185;
    _subTitleRightPos = _screenWidth / 4;
    return Stack(
      children: <Widget>[
        Positioned(
          top: _logoTopPos,
          right: _logoRightPos,
          child: widget.ideaBulbLogo,
          width: _screenWidth / 1.5,
        ),
        Positioned(
          top: _titleTopPos,
          right: _titleRightPos,
          child: builTitleIdea(),
        ),
        Positioned(
          top: _subTitleTopPos,
          right: _subTitleRightPos,
          child: Text(
            'Donnez vie a vos idees!',
            style: TextStyle(
              fontFamily: "Nanum",
              fontSize: 23,
              color: Color(0xff333232),
            ),
          ),
        ),
      ],
    );
  }
}

builTitleIdea() {
  return BorderedText(
    child: Text('Idea',
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
        )),
  );
}
