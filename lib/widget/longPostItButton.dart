import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LongPostItButton extends StatefulWidget {
  final String text;
  final Function onTapUp;

  const LongPostItButton({Key key, @required this.text, @required this.onTapUp})
      : super(key: key);

  @override
  _LongPostItButtonState createState() => _LongPostItButtonState();
}

class _LongPostItButtonState extends State<LongPostItButton> {
  AssetImage _upPic;
  AssetImage _downPic;
  AssetImage _currentPic;

  @override
  void initState() {
    super.initState();
    _upPic = AssetImage('assets/images/buttonsImages/longPostIt/orangeLP.png');
    _downPic =
        AssetImage('assets/images/buttonsImages/longPostIt/orangeLPdown.png');

    _currentPic = _upPic;
  }

//Used to preCache the image to get a smooth image changing transition
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(_upPic, context);
    precacheImage(_downPic, context);
    precacheImage(_downPic, context);
  }

  AudioCache player = new AudioCache();
  String _onTapDownSound = 'sounds/tapOnPaper.mp3';
  String _onTapUpSound = 'sounds/tapOnPaperReverse.mp3';

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
          _currentPic = _upPic;
          player.play(_onTapUpSound);
        });
      },
      onTapCancel: () {
        setState(() {
          _currentPic = _upPic;
          player.play(_onTapUpSound);
        });
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 37,
          maxWidth: 102,
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
