import 'package:flutter/material.dart';
import 'package:idea/routeGenerator.dart';
import 'package:idea/view/newIdea/difficultyCard.dart';
import 'package:idea/view/newIdea/secondPossiblePages/easyIdea/easyIdea.dart';
import 'package:idea/view/newIdea/secondPossiblePages/hardIdea.dart';
import 'package:idea/view/newIdea/secondPossiblePages/mediumIdea.dart';
import 'package:idea/view/newIdea/secondPossiblePages/noDifficultyIdea.dart';

class NewIdea extends StatefulWidget {
  @override
  _NewIdeaState createState() => _NewIdeaState();
}

class _NewIdeaState extends State<NewIdea> {
  @override
  Widget build(BuildContext context) {
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
      child: FirstPageNewIdea(),
    );
  }
}

class FirstPageNewIdea extends StatefulWidget {
  final Image ideaLogo = new Image.asset('assets/images/mainLightBulbLogo.png');
  FirstPageNewIdea({
    Key key,
  }) : super(key: key);
  @override
  _FirstPageNewIdeaState createState() => _FirstPageNewIdeaState();
}

class _FirstPageNewIdeaState extends State<FirstPageNewIdea> {
  GlobalKey buttonKey = GlobalKey<ArrowButtonState>();
  GlobalKey rowCardKey = GlobalKey<DifficultyCardsRowState>();

  ScrollController _sbController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double sidePadding = 20;
    double posTitle = 50;
    double posSubTitle = posTitle + 130;
    double posInstructions = posSubTitle + 80;
    double posButton = MediaQuery.of(context).size.width / 2 - 50;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Builder(builder: (context) {
        return SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              buildImageLogo(context, sidePadding),
              buildTitle(posTitle, sidePadding, context),
              buildSubtitle(posSubTitle, sidePadding),
              buildInstruction(posInstructions, sidePadding),
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 300, 4, 100),
                child: Scrollbar(
                  isAlwaysShown: true,
                  controller: _sbController,
                  child: SingleChildScrollView(
                    controller: _sbController,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 400),
                      child: DifficultyCardsRow(
                        key: rowCardKey,
                        buttonKey: buttonKey,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                width: 100,
                right: posButton,
                child: ArrowButton(
                  key: buttonKey,
                  rowCardKey: rowCardKey,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Positioned buildInstruction(double posInstructions, double sidePadding) {
    return Positioned(
      top: posInstructions,
      left: sidePadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
            "Choisissez une",
            style: TextStyle(
              fontFamily: 'BalsamiqSans',
              fontSize: 24,
              color: Color(0xff000000),
            ),
          ),
          Card(
            elevation: 10,
            child: Material(
              color: Color(0xff91ccff),
              borderRadius: BorderRadius.circular(5),
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                splashColor: Colors.blue,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text(
                        "Les difficultés ? ",
                        style: TextStyle(
                          fontFamily: "ComingSoon",
                          fontSize: 24,
                          color: Color(0xff000000),
                        ),
                      ),
                      content: SingleChildScrollView(
                          child: Text(
                              "Que cela soit une problématique ou une idée bien définie à réaliser tout est possible! Choisissez la difficulté qui correspond aux informations que vous souhaitez partager sur votre nouvelle idée. \r\n\n ★\nVous avez un problème et vous cherchez une idée.\r\n\n ★ ★\nVous avez une idée et vous cherchez comment la réaliser.\r\n\n ★ ★ ★\nVous avez une idée, mais il vous manque les moyens (compétences, matériels, ...) pour la réaliser.\r\n\n ★ ★ ★ ★\nPour une idée dont les moyens pour la réaliser n'ont aucun secrets pour vous.")),
                      actions: <Widget>[
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'))
                      ],
                      elevation: 20.0,
                    ),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3.0, horizontal: 8),
                  child: Text(
                    "difficulté",
                    style: TextStyle(
                      fontFamily: 'BalsamiqSans',
                      fontSize: 24,
                      color: Color(0xff000000),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Positioned buildTitle(
      double posTitle, double sidePadding, BuildContext context) {
    return Positioned(
      top: posTitle,
      left: sidePadding + 20,
      width: 200,
      child: Text(
        "J'ai une idée !",
        style: TextStyle(
          fontFamily: 'BalsamiqSans',
          fontSize: 45,
          color: Color(0xff000000),
          shadows: [
            Shadow(
              offset: Offset(0.00, 3.00),
              color: Color(0xff000000).withOpacity(0.40),
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
      child: Text(
        "Notez la maintenant,\navant qu'elle ne s'échappe… ",
        style: TextStyle(
          fontFamily: 'BalsamiqSans',
          fontSize: 19,
          fontStyle: FontStyle.italic,
          color: Color(0xff9e9e9e),
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

//
//
//The Arrow button displayed at the bottom
class ArrowButton extends StatefulWidget {
  final GlobalKey<DifficultyCardsRowState> rowCardKey;

  ArrowButton({
    Key key,
    @required this.rowCardKey,
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
              switch (widget.rowCardKey.currentState.whichOnIsSelected()) {
                case (0):
                  //Nodifficulty
                  transitionPushToPage(context, CreateNoDifficultyIdea());
                  break;
                case (1):
                  transitionPushToPage(context, InheritedCreateEasyIdea());
                  break;
                case (2):
                  transitionPushToPage(context, CreateMediumIdea());
                  break;
                case (3):
                  transitionPushToPage(context, CreateHardIdea());
                  break;
                default:
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Selectionnez une difficulté'),
                    duration: Duration(seconds: 2),
                  ));
                  break;
              }
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
