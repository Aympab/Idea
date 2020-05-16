import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class TitleSecondPage extends StatefulWidget {
  const TitleSecondPage({
    Key key,
  }) : super(key: key);

  @override
  _TitleSecondPageState createState() => _TitleSecondPageState();
}

class _TitleSecondPageState extends State<TitleSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
              "2.",
              style: TextStyle(
                fontFamily: "ComingSoon",
                fontSize: 36,
                color: Color(0xff000000),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text(
                  "Définition d'une idée",
                  style: TextStyle(
                    fontFamily: "ComingSoon",
                    fontSize: 24,
                    color: Color(0xff000000),
                  ),
                ),
                //TODO : Write a little tutorial about what are difficulties (export widget)
                content: Text('Blablabla'),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'))
                ],
                elevation: 24.0,
              ),
            );
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  // offset: Offset(5, 5),
                  blurRadius: 2,
                  color: Color(0xff91ccff),
                ),
              ],
            ),
            child: Text(
              "Définissez",
              style: TextStyle(
                fontFamily: "ComingSoon",
                fontSize: 24,
                color: Color(0xff000000),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        Text(
          " votre idée",
          style: TextStyle(
            fontFamily: "ComingSoon",
            fontSize: 24,
            color: Color(0xff000000),
          ),
        )
      ],
    );
  }
}

BorderedText subtitleSecondPage() {
  return BorderedText(
    strokeColor: Colors.black.withOpacity(0.8),
    strokeWidth: 0.8,
    child: Text(
      "Pour nous expliquer",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "ComingSoon",
        fontSize: 15,
        color: Color(0xff9e9e9e),
      ),
    ),
  );
}
