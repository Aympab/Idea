import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import 'newIdeaDifficulty.dart';

//The row containing all the cards,
class DifficultyCardsRow extends StatefulWidget {
  GlobalKey<ArrowButtonState> buttonKey;

  DifficultyCardsRow({
    Key key,
    @required this.buttonKey,
  }) : super(key: key);

  @override
  _DifficultyCardsRowState createState() => _DifficultyCardsRowState();
}

class _DifficultyCardsRowState extends State<DifficultyCardsRow> {
  static GlobalKey<_DifficultyCardState> noDiffKey =
      GlobalKey<_DifficultyCardState>();
  static GlobalKey<_DifficultyCardState> easyKey =
      GlobalKey<_DifficultyCardState>();
  static GlobalKey<_DifficultyCardState> medKey =
      GlobalKey<_DifficultyCardState>();
  static GlobalKey<_DifficultyCardState> hardKey =
      GlobalKey<_DifficultyCardState>();

  @override
  Widget build(BuildContext context) {
    NoDifficultyIdea noDifficultyIdea = NoDifficultyIdea(
        key: noDiffKey,
        cardKeys: [easyKey, medKey, hardKey],
        buttonKey: widget.buttonKey);
    EasyDifficultyIdea easyDifficultyIdea = EasyDifficultyIdea(
        key: easyKey,
        cardKeys: [noDiffKey, medKey, hardKey],
        buttonKey: widget.buttonKey);
    MediumDifficultyIdea mediumDifficultyIdea = MediumDifficultyIdea(
        key: medKey,
        cardKeys: [easyKey, noDiffKey, hardKey],
        buttonKey: widget.buttonKey);
    HardDifficultyIdea hardDifficultyIdea = HardDifficultyIdea(
        key: hardKey,
        cardKeys: [easyKey, medKey, noDiffKey],
        buttonKey: widget.buttonKey);

    return Row(
      children: <Widget>[
        noDifficultyIdea,
        easyDifficultyIdea,
        mediumDifficultyIdea,
        hardDifficultyIdea
      ],
    );
  }
}

//
//
//
//
//
//One card
class DifficultyCard extends StatefulWidget {
  final List<GlobalKey<_DifficultyCardState>> cardKeys;
  final GlobalKey<ArrowButtonState> buttonKey;

  DifficultyCard({
    Key key,
    @required this.borderAndSplashColor,
    @required this.cardColor,
    @required this.cardWidth,
    @required this.cardHeight,
    @required this.starNumber,
    @required this.listeElements,
    this.cardKeys,
    this.buttonKey,
  }) : super(key: key);

  final Color borderAndSplashColor; //
  final Color cardColor; // = Colors.amber[50];
  final double cardWidth; // = 138;
  final double cardHeight; // = 100;
  final int starNumber; // = 1;
  final String listeElements;
  bool isSelected = false;
  @override
  _DifficultyCardState createState() => _DifficultyCardState();
}

class _DifficultyCardState extends State<DifficultyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(
          color: widget.borderAndSplashColor,
          width: 3,
        ),
      ),
      elevation: 20,
      shadowColor: Colors.black.withOpacity(1),
      color: widget.isSelected
          ? widget.borderAndSplashColor.withOpacity(0.5)
          : widget.cardColor,
      child: InkWell(
        //TODO :
        onTap: () {
          setState(() {
            widget.isSelected = !widget.isSelected;
            if (widget.isSelected) {
              for (GlobalKey<_DifficultyCardState> cardKey in widget.cardKeys) {
                cardKey.currentState.disable();
              }
              widget.buttonKey.currentState.enable();
            } else {
              widget.buttonKey.currentState.disable();
            }
          });
        },
        splashColor: widget.borderAndSplashColor,
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          width: widget.cardWidth,
          height: widget.cardHeight,
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          widget.starNumber,
                          (_) => Icon(
                                Icons.star,
                                color: widget.borderAndSplashColor,
                              )).toList(),
                    ),
                  ),
                  Container(
                    height: 2,
                    color: widget.borderAndSplashColor,
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Expanded(
                    child: Center(
                      child: Text(
                        widget.listeElements,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "ComingSoon",
                          fontSize: 18,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void disable() {
    setState(() {
      widget.isSelected = false;
    });
  }
}

//
//
//
//
//The differents difficulties
class NoDifficultyIdea extends DifficultyCard {
  NoDifficultyIdea(
      {Key key,
      List<GlobalKey<_DifficultyCardState>> cardKeys,
      GlobalKey<ArrowButtonState> buttonKey})
      : super(
          borderAndSplashColor: Colors.brown,
          cardColor: Colors.amber[50],
          cardWidth: 138,
          cardHeight: 100,
          starNumber: 1,
          listeElements: "Texte court\nImage",
          key: key,
          cardKeys: cardKeys,
          buttonKey: buttonKey,
        );
}

class EasyDifficultyIdea extends DifficultyCard {
  EasyDifficultyIdea(
      {Key key,
      List<GlobalKey<_DifficultyCardState>> cardKeys,
      GlobalKey<ArrowButtonState> buttonKey})
      : super(
          borderAndSplashColor: Colors.green,
          cardColor: Colors.green[50],
          cardWidth: 138,
          cardHeight: 100 * 1.5,
          starNumber: 2,
          listeElements: "+ Description",
          key: key,
          cardKeys: cardKeys,
          buttonKey: buttonKey,
        );
}

class MediumDifficultyIdea extends DifficultyCard {
  MediumDifficultyIdea(
      {Key key,
      List<GlobalKey<_DifficultyCardState>> cardKeys,
      GlobalKey<ArrowButtonState> buttonKey})
      : super(
          borderAndSplashColor: Colors.blue,
          cardColor: Colors.blue[50],
          cardWidth: 138,
          cardHeight: 100 * 2.0,
          starNumber: 3,
          listeElements: "+ Besoins\n\t+ compétences\n\t+ matériel",
          key: key,
          cardKeys: cardKeys,
          buttonKey: buttonKey,
        );
}

class HardDifficultyIdea extends DifficultyCard {
  HardDifficultyIdea(
      {Key key,
      List<GlobalKey<_DifficultyCardState>> cardKeys,
      GlobalKey<ArrowButtonState> buttonKey})
      : super(
          borderAndSplashColor: Colors.red[900],
          cardColor: Colors.red[50],
          cardWidth: 138,
          cardHeight: 100 * 2.5,
          starNumber: 4,
          listeElements:
              "+ Contacts\n+ Plan d'action\n+ Finance\n\n\tet d'autres...",
          key: key,
          cardKeys: cardKeys,
          buttonKey: buttonKey,
        );
}

//
//
//
//
//
//The Arrow button displayed at the bottom
class ArrowButton extends StatefulWidget {
  ArrowButton({
    Key key,
  }) : super(key: key);

  @override
  ArrowButtonState createState() => ArrowButtonState();
}

class ArrowButtonState extends State<ArrowButton> {
  bool isButtonEnabled = false;

  void enable() {
    setState(() {
      isButtonEnabled = true;
    });
  }

  void disable() {
    setState(() {
      isButtonEnabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: isButtonEnabled
          ? () {
              //TODO : Route to next page nicely
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(seconds: 3),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {

                    animation = CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeInExpo,
                    );

                    return ScaleTransition(
                      scale: animation,
                      child: child,
                      alignment: Alignment.center,
                    );
                  },
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secAnimation) {
                    return CreateNoDifficultyIdea();
                  },
                ),
              );
            }
          : () {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Selectionnez une difficulté'),
                duration: Duration(seconds: 2),
              ));
            },
      child: Image.asset('assets/images/buttonsImages/nextWhite.png'),
    );
  }
}

class CreateNoDifficultyIdea extends StatefulWidget {
  @override
  _CreateNoDifficultyIdeaState createState() => _CreateNoDifficultyIdeaState();
}

class _CreateNoDifficultyIdeaState extends State<CreateNoDifficultyIdea> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
