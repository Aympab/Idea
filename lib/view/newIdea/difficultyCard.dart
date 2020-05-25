import 'package:flutter/material.dart';

import 'newIdeaDifficulty.dart';

//The row containing all the cards,
class DifficultyCardsRow extends StatefulWidget {
  final GlobalKey<ArrowButtonState> buttonKey;

  DifficultyCardsRow({
    Key key,
    @required this.buttonKey,
  }) : super(key: key);

  @override
  DifficultyCardsRowState createState() => DifficultyCardsRowState();
}

class DifficultyCardsRowState extends State<DifficultyCardsRow> {
  int whichOnIsSelected() {
    if (noDiffKey.currentState.isSelected) {
      return 0;
    } else if (easyKey.currentState.isSelected) {
      return 1;
    } else if (medKey.currentState.isSelected) {
      return 2;
    } else if (hardKey.currentState.isSelected) {
      return 3;
    }
    return -1;
  }

  static GlobalKey<DifficultyCardState> noDiffKey =
      GlobalKey<DifficultyCardState>();
  static GlobalKey<DifficultyCardState> easyKey =
      GlobalKey<DifficultyCardState>();
  static GlobalKey<DifficultyCardState> medKey =
      GlobalKey<DifficultyCardState>();
  static GlobalKey<DifficultyCardState> hardKey =
      GlobalKey<DifficultyCardState>();

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
  final List<GlobalKey<DifficultyCardState>> cardKeys;
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
  @override
  DifficultyCardState createState() => DifficultyCardState();
}

class DifficultyCardState extends State<DifficultyCard> {
  
  bool isSelected = false;
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
      elevation: 10,
      shadowColor: Colors.black.withOpacity(1),
      color: isSelected
          ? widget.borderAndSplashColor.withOpacity(0.5)
          : widget.cardColor,
      child: InkWell(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
            if (isSelected) {
              for (GlobalKey<DifficultyCardState> cardKey in widget.cardKeys) {
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
      isSelected = false;
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
      List<GlobalKey<DifficultyCardState>> cardKeys,
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
      List<GlobalKey<DifficultyCardState>> cardKeys,
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
      List<GlobalKey<DifficultyCardState>> cardKeys,
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
      List<GlobalKey<DifficultyCardState>> cardKeys,
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
