import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:idea/view/newIdea/difficultyCard.dart';

class NewIdeaDifficulty extends StatefulWidget {
  final Image ideaLogo = new Image.asset('assets/images/mainLightBulbLogo.png');

  @override
  _NewIdeaDifficultyState createState() => _NewIdeaDifficultyState();
}

class _NewIdeaDifficultyState extends State<NewIdeaDifficulty> {
  @override
  Widget build(BuildContext context) {
    double sidePadding = 20;
    double posTitle = 30;
    double posSubTitle = posTitle + 120;
    double posInstructions = posSubTitle + 80;
    double posCardView = posInstructions + 80;

    return DecoratedBox(
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
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              buildImageLogo(context, sidePadding),
              buildTitle(posTitle, sidePadding, context),
              buildSubtitle(posSubTitle, sidePadding),
              buildInstruction(posInstructions, sidePadding),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 200, 8.0, 0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    child: DifficultyCardsRow(),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                width: 100,
                right: MediaQuery.of(context).size.width/2 -50,
                  child: FlatButton(
                onPressed: () {
                  //TODO 
                },
                child: Image.asset('assets/images/buttonsImages/nextWhite.png'),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Positioned buildInstruction(double posInstructions, double sidePadding) {
    return Positioned(
      top: posInstructions,
      left: sidePadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            height: 43.00,
            width: 43.00,
            decoration: BoxDecoration(
              color: Color(0xff91ccff),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                "1.",
                style: TextStyle(
                  fontFamily: "ComingSoon",
                  fontSize: 36,
                  color: Color(0xff000000),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "Choisissez une ",
            style: TextStyle(
              fontFamily: "ComingSoon",
              fontSize: 24,
              color: Color(0xff000000),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  // offset: Offset(5, 5),
                  blurRadius: 2,
                  color: Color(0xff91ccff),
                ),
              ],
            ),
            child: InkWell(
              //TODO : show a little popUp that explains what is the difficulty of an idea
              onTap: () => print('hey'),
              splashColor: Colors.blueGrey,
              child: Text(
                "difficulté",
                style: TextStyle(
                  fontFamily: "ComingSoon",
                  fontSize: 24,
                  color: Color(0xff000000),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  //
  //
  //Build des différents elements
  Positioned buildTitle(
      double posTitle, double sidePadding, BuildContext context) {
    return Positioned(
      top: posTitle,
      left: sidePadding,
      width: MediaQuery.of(context).size.width / 2 + 50,
      child: Text(
        "J'ai une bonne idée !",
        style: TextStyle(
          fontFamily: "ComingSoon",
          fontSize: 39,
          color: Color(0xff000000),
          shadows: [
            Shadow(
              offset: Offset(0.00, 3.00),
              color: Color(0xff000000).withOpacity(0.86),
              blurRadius: 6,
            ),
          ],
        ),
      ),
    );
  }

  Positioned buildSubtitle(double posSubtitle, double sidePadding) {
    return Positioned(
      top: posSubtitle,
      left: sidePadding + 20,
      child: BorderedText(
        strokeColor: Colors.black,
        strokeWidth: 0.5,
        child: Text(
          "Notez la maintenant,\navant qu'elle ne s'échappe… ",
          style: TextStyle(
            fontFamily: "ComingSoon",
            fontSize: 19,
            color: Color(0xff9e9e9e),
          ),
        ),
      ),
    );
  }

  Positioned buildImageLogo(BuildContext context, double sidePadding) {
    return Positioned(
      width: MediaQuery.of(context).size.width / 3,
      right: sidePadding,
      top: sidePadding,
      child: Transform.rotate(
        angle: 0.2,
        child: widget.ideaLogo,
      ),
    );
  }
}
