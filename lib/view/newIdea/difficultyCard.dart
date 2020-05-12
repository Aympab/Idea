import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class DifficultyCard extends StatelessWidget {
  DifficultyCard({
    Key key,
    @required this.borderAndSplashColor,
    @required this.cardColor,
    @required this.cardWidth,
    @required this.cardHeight,
    @required this.starNumber,
    @required this.listeElements,
  }) : super(key: key);

  final Color borderAndSplashColor; //
  final Color cardColor; // = Colors.amber[50];
  final double cardWidth; // = 138;
  final double cardHeight; // = 100;
  final int starNumber; // = 1;
  final String listeElements;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(
          color: borderAndSplashColor,
          width: 3,
        ),
      ),
      elevation: 20,
      shadowColor: Colors.black.withOpacity(1),
      color: cardColor,
      child: InkWell(
        onTap: () => print('hello'),
        splashColor: borderAndSplashColor,
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          width: cardWidth,
          height: cardHeight,
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
                          starNumber,
                          (_) => Icon(
                                Icons.star,
                                color: borderAndSplashColor,
                              )).toList(),
                    ),
                  ),
                  Container(
                    height: 2,
                    color: borderAndSplashColor,
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Expanded(
                    child: Center(
                      child: Text(
                        listeElements,
                        textAlign: TextAlign.center,
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
}

class NoDifficultyIdea extends DifficultyCard {
  NoDifficultyIdea()
      : super(
          borderAndSplashColor: Colors.brown,
          cardColor: Colors.amber[50],
          cardWidth: 138,
          cardHeight: 100,
          starNumber: 1,
          listeElements: "Texte court\nImage",
        );
}

class EasyDifficultyIdea extends DifficultyCard {
  EasyDifficultyIdea()
      : super(
          borderAndSplashColor: Colors.green,
          cardColor: Colors.amber[50],
          cardWidth: 138,
          cardHeight: 100 * 2.0,
          starNumber: 2,
          listeElements: "Texte court\nImage",
        );
}

class MediumDifficultyIdea extends DifficultyCard {
  MediumDifficultyIdea()
      : super(
          borderAndSplashColor: Colors.blue,
          cardColor: Colors.amber[50],
          cardWidth: 138,
          cardHeight: 100 * 3.0,
          starNumber: 3,
          listeElements: "Texte court\nImage",
        );
}

class HardDifficultyIdea extends DifficultyCard {
  HardDifficultyIdea()
      : super(
          borderAndSplashColor: Colors.red[900],
          cardColor: Colors.amber[50],
          cardWidth: 138,
          cardHeight: 100 * 4.0,
          starNumber: 4,
          listeElements: "Texte court\nImage",
        );
}
