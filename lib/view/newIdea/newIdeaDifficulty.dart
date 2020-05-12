import 'package:flutter/material.dart';

class NewIdeaDifficulty extends StatefulWidget {
  final Image ideaLogo = new Image.asset('assets/images/mainLightBulbLogo.png');

  @override
  _NewIdeaDifficultyState createState() => _NewIdeaDifficultyState();
}

class _NewIdeaDifficultyState extends State<NewIdeaDifficulty> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFC114).withOpacity(1.0),
            Color(0xF8EABF).withOpacity(1.0),
          ],
        ),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              widget.ideaLogo,
              new Text(
                "J'ai une bonne idée !",
                style: TextStyle(
                  fontFamily: "Coming Soon",
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
              new Text(
                "Notez la maintenant,\navant qu'elle ne s'échappe… ",
                style: TextStyle(
                  fontFamily: "Coming Soon",
                  fontSize: 19,
                  color: Color(0xff9e9e9e),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
