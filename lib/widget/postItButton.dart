import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostItButton extends StatefulWidget {
  final String text;
  final Function onTapUp;

  final double maxWidth;
  final double maxHeight;

  const PostItButton({
    Key key,
    @required this.text,
    @required this.onTapUp,
    this.maxWidth: 150,
    this.maxHeight: 150,
  }) : super(key: key);

  @override
  _PostItButtonState createState() => _PostItButtonState();
}

class _PostItButtonState extends State<PostItButton> {
  Random random = new Random();

  AssetImage _imageUpLeftCorner;
  AssetImage _imageUpRightCorner;
  AssetImage _downPic;
  AssetImage _currentPic;

  @override
  void initState() {
    super.initState();
    _imageUpLeftCorner =
        AssetImage('assets/images/buttonsImages/postItLeftCornerUp.png');
    _imageUpRightCorner =
        AssetImage('assets/images/buttonsImages/postItRightCorner.png');
    _downPic = AssetImage('assets/images/buttonsImages/postItSquare.png');

    _currentPic = random.nextBool() ? _imageUpLeftCorner : _imageUpRightCorner;
  }

//Used to preCache the image to get a smooth image changing transition
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(_imageUpLeftCorner, context);
    precacheImage(_imageUpRightCorner, context);
    precacheImage(_downPic, context);
  }

  AudioCache player = new AudioCache();
  String _onTapDownSound = 'sounds/tapOnPaper.mp3';
  String _onTapUpSound = 'sounds/tapOnPaperReverse.mp3';

  RenderBox renderBox;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        setState(() {
          _currentPic = _downPic;
          player.play(_onTapDownSound);
        });
      },
      onTapUp: (TapUpDetails details) {
        widget.onTapUp();
        setState(() {
          //Displaying either left or right corner up depending on the position of the tap
          renderBox = context.findRenderObject();
          _currentPic = renderBox.globalToLocal(details.globalPosition).dx < 65
              ? _imageUpLeftCorner
              : _imageUpRightCorner;
          player.play(_onTapUpSound);
        });
      },
      onTapCancel: () {
        setState(() {
          _currentPic =
              random.nextBool() ? _imageUpLeftCorner : _imageUpRightCorner;
          player.play(_onTapUpSound);
        });
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: widget.maxHeight,
          maxWidth: widget.maxWidth,
        ),
        child: Container(
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Stack(
              children: <Widget>[
                Image(image: _currentPic),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      widget.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Nanum",
                        fontSize: 23,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
