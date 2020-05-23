import 'dart:io';

import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:idea/view/newIdea/secondPossiblePages/easyIdea/easyIdea.dart';
import 'package:image_picker/image_picker.dart';

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
      validator: (value) => value.isNotEmpty && value.length <= 30 && value.length > 2
          ? null
          : value.isEmpty || value.length < 3  ?  "C'est un peu court !" : "C'est un peu long ! (Max. 30 carac.)",
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
        hintText: 'Trouvez un nom à votre idée...',
        hintStyle: TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontStyle: FontStyle.italic,
        ),
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
        hintText: "En quoi consiste l'idée ? Expliquez nous...",
        hintStyle: TextStyle(
            fontFamily: "ComingSoon",
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
  File ideaImage;

  Future getImage() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Ajouter une image',
              style: TextStyle(
                fontFamily: "ComingSoon",
                fontSize: 24,
                color: Color(0xff000000),
              ),
            ),
            content: Text(
                'Prendre une nouvelle photo ou choisir dans la gallerie ?'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () async {
                  var image =
                      await ImagePicker.pickImage(source: ImageSource.camera);
                  if (image != null) Navigator.of(context).pop();
                  setState(
                    () {
                      ideaImage = image;
                    },
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.photo_size_select_actual),
                onPressed: () async {
                  var image =
                      await ImagePicker.pickImage(source: ImageSource.gallery);

                  if (image != null) Navigator.of(context).pop();
                  setState(
                    () {
                      ideaImage = image;
                    },
                  );
                },
              ),
            ],
          );
        });
  }

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
        GestureDetector(
          onTap: getImage,
          child: Container(
            height: 280,
            width: 280,
            child: ideaImage == null
                ? Transform.translate(
                  offset: Offset(0, -20),
                    child: Transform.scale(
                        scale: 10,
                        child: Icon(
                          Icons.photo_size_select_actual,
                          color: Colors.white70,
                        )),
                  )
                : Image.file(ideaImage),
          ),
        )
      ],
    );
  }
}
