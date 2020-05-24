import 'dart:io';
import 'dart:math';

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
      crossAxisAlignment: CrossAxisAlignment.center,
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
        Card(
          child: Material(
            color: Color(0xff91ccff),
            borderRadius: BorderRadius.circular(5),
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
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
              splashColor: Colors.blue,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 8),
                child: Text(
                  "Définissez",
                  style: TextStyle(
                    fontFamily: "BalsamiqSans",
                    fontSize: 24,
                    color: Color(0xff000000),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
        ),
        Text(
          "votre idée",
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

Text subtitleSecondPage() {
  return Text(
    getRandomSubtitle(),
    textAlign: TextAlign.center,
    style: TextStyle(
      fontFamily: "BalsamiqSans",
      fontSize: 18,
      fontStyle: FontStyle.italic,
      color: Colors.grey[700],
    ),
  );
}

//Return random text to put in subtitle
//Pcq j'arrivais pas a me décider
String getRandomSubtitle() {
  Random rd = new Random();

  switch (rd.nextInt(5)) {
    case 0:
      //Un truc un peu perso un peu sérieux ?
      return "C'est le plus important";
    case 1:
      //Un truc plutot "perso" comme ca ?
      return "On veut comprendre !";
    case 2:
      //Un truc plus concret ?
      return "Pour nous expliquer";
    case 3:
      //Un truc "encourageant" ??
      return "Après c'est la dernière étape !";
    case 4:
      return "Sans trop vous prendre la tête...";
    default:
      return '';
  }
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
        fontFamily: "BalsamiqSans",
        fontSize: 26,
        color: Color(0xFF000000),
      ),
      onChanged: (value) {
        setState(() => ideaName = value);
      },
      validator: (value) =>
          value.isNotEmpty && value.length <= 30 && value.length > 2
              ? null
              : value.isEmpty || value.length < 3
                  ? "C'est un peu court !"
                  : "C'est un peu long ! (Max. 30 carac.)",
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
            fontFamily: "BalsamiqSans",
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
              fontFamily: "BalsamiqSans",
              fontSize: 16,
              color: Color(0xff000000),
              // fontStyle: FontStyle.italic,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: getImage,
          child: ideaImage == null
              ? Container(
                  height: 200,
                  width: 200,
                  child: Transform.scale(
                    scale: 10,
                    child: Icon(
                      Icons.photo_size_select_actual,
                      color: Colors.white70,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                      height: 280, width: 280, child: Image.file(ideaImage)),
                ),
        ),
      ],
    );
  }
}
