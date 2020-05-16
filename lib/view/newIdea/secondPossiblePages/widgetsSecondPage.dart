import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

///
///
///
///
///TITLE ("2.Définissez votre idée")
///
///
///
///
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

///
///
///
///IDEA NAME
///
///
///
///
class TextFieldIdeaName extends StatefulWidget {
  TextFieldIdeaName({
    Key key,
  }) : super(key: key);

  @override
  TextFieldIdeaNameState createState() => TextFieldIdeaNameState();
}

class TextFieldIdeaNameState extends State<TextFieldIdeaName> {
  String ideaName = '';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontFamily: "ComingSoon",
        fontSize: 26,
        color: Color(0xFF000000),
      ),
      onChanged: (value) {
        setState(() => ideaName = value);
      },
      validator: (value) => value.isNotEmpty && value.length <= 30
          ? null
          : 'Entrez un nom de max. 30 caractères',
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFC114).withOpacity(1.0),
            width: 5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        fillColor: Color(0x1B9200).withOpacity(0.2),
        filled: true,
        hintText: 'Trouvez un nom à votre idée !',
        hintStyle: TextStyle(fontSize: 15, color: Colors.white),
        errorStyle: TextStyle(color: Colors.red),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
      ),
    );
  }
}

///
///
///
///SHORT DESCRPTION
///
///
class TextFieldShortDescription extends StatefulWidget {
  const TextFieldShortDescription({
    Key key,
  }) : super(key: key);

  @override
  TextFieldShortDescriptionState createState() =>
      TextFieldShortDescriptionState();
}

class TextFieldShortDescriptionState extends State<TextFieldShortDescription> {
  String description;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        setState(() {
          description = value;
        });
      },
      validator: (value) => value.isEmpty ? 'Entrez une description' : null,
      keyboardType: TextInputType.multiline,
      minLines: 3,
      maxLines: 10,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFC114).withOpacity(1.0),
            width: 5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        fillColor: Color(0x1B9200).withOpacity(0.2),
        filled: true,
        hintText: "Décrivez brièvement comment est venu l'idée",
        hintStyle: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w300),
        errorStyle: TextStyle(color: Colors.red),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
      ),
    );
  }
}

///
///
///
///
///
///PICTURE FIELD
///
///
///
class PictureField extends StatefulWidget {
  const PictureField({
    Key key,
  }) : super(key: key);

  @override
  PictureFieldState createState() => PictureFieldState();
}

class PictureFieldState extends State<PictureField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            "Avec une image, un dessin ou une photo, c'est toujours plus clair ! (facultatif)",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: "Coming Soon",
                fontSize: 16,
                color: Color(0xff000000),
                fontStyle: FontStyle.italic),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 250,
          width: 250,
          color: Colors.white,
        )
      ],
    );
  }
}
