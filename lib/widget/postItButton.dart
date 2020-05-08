import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostItButton extends StatefulWidget {
  final String text;

  const PostItButton({Key key, this.text}) : super(key: key);

  @override
  _PostItButtonState createState() => _PostItButtonState();
}

class _PostItButtonState extends State<PostItButton> {
  //Je les mets en static pour qu'il le charge qu'une fois je sais pas trop si c'est une bonne idée ou pas
  static AssetImage _upPic =
      AssetImage('assets/images/buttonsImages/postItLeftCornerUp.png');

  static AssetImage _downPic =
      AssetImage('assets/images/buttonsImages/postItSquare.png');

  AssetImage _myPic = _upPic;

  AudioCache player = new AudioCache();
  String _onTapDownSound = 'sounds/tapOnPaper.mp3';
  String _onTapUpSound = 'sounds/tapOnPaperReverse.mp3';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (TapDownDetails details) {
          setState(() {
            _myPic = _downPic;
            player.play(_onTapDownSound);
            print('tapDown');
          });
        },
        onTapUp: (TapUpDetails details) {
          setState(() {
            _myPic = _upPic;
            player.play(_onTapUpSound);
            print('tapUp');
          });
        },
        onTapCancel: () {
          setState(() {
            _myPic = _upPic;
            player.play(_onTapUpSound);
            print('tapCancel');
          });
        },
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 120,
            maxWidth: 120,
          ),
          child: Container(
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Ink.image(
                image: _myPic,
                fit: BoxFit.fill,
                child: InkWell(
                  splashColor: Colors.black,
                  enableFeedback: false,
                  // onTapDown: (){},
                  // onTapCancel: ,
                ),
              ),
            ),
          ),
        ));
  }
}
