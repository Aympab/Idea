import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Original height and width of the picture to always hace the good ration for the image
double originalHeight = 105;
double originalWidth = 291;

class LongPostItButton extends StatefulWidget {
  final double fontSize;
  final String text;
  final Function onTapUp;
  //TODO : Implement colorChanger
  final LPColors color;

  const LongPostItButton(
      {Key key,
      @required this.text,
      @required this.onTapUp,
      this.color = LPColors.orange,
      this.fontSize = 27})
      : super(key: key);

  @override
  _LongPostItButtonState createState() => _LongPostItButtonState();
}

enum LPColors { orange, pink, red, blue, lightBlue, green }

AssetImage getAsset(String color) =>
    AssetImage('assets/images/buttonsImages/longPostIt/${color}LP.png');

class _LongPostItButtonState extends State<LongPostItButton> {
  AssetImage _pic;

  static BoxShadow _initShadow = BoxShadow(
      blurRadius: 10,
      color: Colors.black.withOpacity(0.7),
      offset: Offset(10, 2));

  BoxShadow _currentShadow = _initShadow;

  @override
  void initState() {
    super.initState();

    switch (widget.color) {
      case LPColors.orange:
        _pic = getAsset('orange');
        break;
      case LPColors.blue:
        _pic = getAsset('blue');
        break;
      case LPColors.green:
        _pic = getAsset('green');
        break;
      case LPColors.lightBlue:
        _pic = getAsset('lightBlue');
        break;
      case LPColors.red:
        _pic = getAsset('red');
        break;
      case LPColors.pink:
        _pic = getAsset('pink');
        break;
      default:
        _pic = getAsset('orange');

        _currentShadow = _initShadow;
    }
  }

//Used to preCache the image to get a smooth image changing transition
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(_pic, context);
  }

  AudioCache player = new AudioCache();
  String _onTapDownSound = 'sounds/tapOnPaper.mp3';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        setState(() {
          _currentShadow = BoxShadow(
            blurRadius: 4,
            color: Colors.black.withOpacity(0.7),
            offset: Offset(5, 0),
          );
          player.play(_onTapDownSound);
        });
      },
      onTapUp: (TapUpDetails details) {
        widget.onTapUp();
        setState(() {
          _currentShadow = _initShadow;
        });
      },
      onTapCancel: () {
        setState(() {
          _currentShadow = _initShadow;
        });
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: originalHeight * 0.8,
          maxWidth: originalWidth * 0.8,
        ),
        child: Container(
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Stack(
              children: <Widget>[
                DecoratedBox(
                    decoration: BoxDecoration(
                      boxShadow: [
                        _currentShadow,
                      ],
                    ),
                    child: Image(image: _pic)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Nanum",
                      fontSize: widget.fontSize,
                      color: Colors.black,
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
