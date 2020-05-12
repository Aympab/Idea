import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class DifficultyCardsRow extends StatefulWidget {
final GlobalKey<_DifficultyCardState> noDiffKey;
final GlobalKey<_DifficultyCardState> easyKey;
final GlobalKey<_DifficultyCardState> medKey;
final GlobalKey<_DifficultyCardState> hardKey;

  const DifficultyCardsRow({
    Key key, this.noDiffKey, this.easyKey, this.medKey, this.hardKey,
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

  NoDifficultyIdea noDifficultyIdea =
      NoDifficultyIdea(key: noDiffKey, cardKeys: [easyKey, medKey, hardKey]);
  EasyDifficultyIdea easyDifficultyIdea =
      EasyDifficultyIdea(key: easyKey, cardKeys: [noDiffKey, medKey, hardKey]);
  MediumDifficultyIdea mediumDifficultyIdea = MediumDifficultyIdea(
      key: medKey, cardKeys: [easyKey, noDiffKey, hardKey]);
  HardDifficultyIdea hardDifficultyIdea =
      HardDifficultyIdea(key: hardKey, cardKeys: [easyKey, medKey, noDiffKey]);

  @override
  Widget build(BuildContext context) {

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
//
class DifficultyCard extends StatefulWidget {
  final List<GlobalKey<_DifficultyCardState>> cardKeys;

  DifficultyCard({
    Key key,
    @required this.borderAndSplashColor,
    @required this.cardColor,
    @required this.cardWidth,
    @required this.cardHeight,
    @required this.starNumber,
    @required this.listeElements,
    this.cardKeys,
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
            for (GlobalKey<_DifficultyCardState> cardKey in widget.cardKeys) {
              if (cardKey != null) cardKey.currentState.disabled();
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

  void disabled() {
    setState(() {
      widget.isSelected = false;
    });
  }
}

class NoDifficultyIdea extends DifficultyCard {
  NoDifficultyIdea({Key key, List<GlobalKey<_DifficultyCardState>> cardKeys})
      : super(
            borderAndSplashColor: Colors.brown,
            cardColor: Colors.amber[50],
            cardWidth: 138,
            cardHeight: 100,
            starNumber: 1,
            listeElements: "Texte court\nImage",
            key: key,
            cardKeys: cardKeys);
}

class EasyDifficultyIdea extends DifficultyCard {
  EasyDifficultyIdea({Key key, List<GlobalKey<_DifficultyCardState>> cardKeys})
      : super(
            borderAndSplashColor: Colors.green,
            cardColor: Colors.green[50],
            cardWidth: 138,
            cardHeight: 100 * 1.5,
            starNumber: 2,
            listeElements: "+ Description",
            key: key,
            cardKeys: cardKeys);
}

class MediumDifficultyIdea extends DifficultyCard {
  MediumDifficultyIdea(
      {Key key, List<GlobalKey<_DifficultyCardState>> cardKeys})
      : super(
            borderAndSplashColor: Colors.blue,
            cardColor: Colors.blue[50],
            cardWidth: 138,
            cardHeight: 100 * 2.0,
            starNumber: 3,
            listeElements: "+ Besoins\n\t+ compétences\n\t+ matériel",
            key: key,
            cardKeys: cardKeys);
}

class HardDifficultyIdea extends DifficultyCard {
  HardDifficultyIdea({Key key, List<GlobalKey<_DifficultyCardState>> cardKeys})
      : super(
            borderAndSplashColor: Colors.red[900],
            cardColor: Colors.red[50],
            cardWidth: 138,
            cardHeight: 100 * 2.5,
            starNumber: 4,
            listeElements:
                "+ Contacts\n+ Plan d'action\n+ Finance\n\n\tet d'autres...",
            key: key,
            cardKeys: cardKeys);
}
