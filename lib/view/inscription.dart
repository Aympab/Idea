import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idea/model/designs/userProfile.dart';
import 'package:idea/model/designs/userProfileRelated.dart';
import 'package:idea/model/user.dart';
import 'package:idea/tools/dateParser.dart';
import 'package:idea/tools/themes.dart';
import 'package:idea/widget/longPostItButton.dart';
import 'package:idea/widget/multiSelect.dart';
import 'package:image_picker/image_picker.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'dart:io';
import 'dart:async';

import 'package:provider/provider.dart';

class InscriptionView extends StatefulWidget {
  InscriptionView({Key key}) : super(key: key);
  static String tag = 'inscription-page';

  @override
  _InscriptionViewState createState() => _InscriptionViewState();
}

class _InscriptionViewState extends State<InscriptionView> {
  File image;
  Future getImageGallery() async {
    File picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = picture;
    });
  }

  DateTime _dateTime;

  List selectedCompetences = [];
  List selectedMaterials = [];

  bool _valueCheckboxCGU = false;
  bool _valueCheckboxNewsLetter = false;

  TextEditingController pseudoController = new TextEditingController();
  TextEditingController mailController = new TextEditingController();
  TextEditingController mdpController = new TextEditingController();
  TextEditingController confirmationmdpController = new TextEditingController();
  TextEditingController dateNaissanceController = new TextEditingController();
  TextEditingController nomController = new TextEditingController();
  TextEditingController prenomController = new TextEditingController();
  TextEditingController zoneGeographiqueController =
      new TextEditingController();

  bool _PseudoValidator = false;
  bool _EmailValidator = false;
  FocusNode focusNodePseudo;
  FocusNode focusNodeEmail;
  void initState() {
    super.initState();
    focusNodePseudo = new FocusNode();
    focusNodeEmail = new FocusNode();
    focusNodePseudo.addListener(() {
      if (!focusNodePseudo.hasFocus) {
        setState(() {
          _PseudoValidator = true;
        });
      }
    });
    focusNodeEmail.addListener(() {
      if (!focusNodeEmail.hasFocus) {
        setState(() {
          _EmailValidator = true;
        });
      }
    });
  }

//FIXME
  var myCompetence_1 = {"value": 1, "name": "Bricolage"};
  var myCompetence_2 = {"value": 2, "name": "Jardinage"};
  var myCompetence_3 = {"value": 3, "name": "Mécano"};
  var myCompetence_4 = {"value": 4, "name": "Architecte"};
  var myCompetence_5 = {"value": 5, "name": "Gestion de Projet"};

  var myMateriel_1 = {"value": 1, "name": "Marteau"};
  var myMateriel_2 = {"value": 2, "name": "Imprimante 3D"};
  var myMateriel_3 = {"value": 3, "name": "Ciseaux"};
  var myMateriel_4 = {"value": 4, "name": "Tourne-vis"};
  var myMateriel_5 = {"value": 5, "name": "Métal"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inscription"),
        leading: IconButton(
          icon: Image.asset('assets/logo.png'),
          onPressed: () {
            Provider.of<ThemeModel>(context, listen: false).toggleTheme();
          },
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        //Ici on détermine quel méthode de build on va appeler en fonctoin du state
        child: buildInitialInput(),
      ),
    );
  }

  Text _buildTileTitle(String title) => Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontSize: 20),
      );

  Widget showImage() {
    return image == null ? Icon(Icons.person) : Image.file(image);
  }

  //On a un build par state en fait, donc on a plusieurs UI par states
  Widget buildInitialInput() {
    final separator = new Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: Divider(
              color: Colors.black,
              height: 50,
            )),
      )
    ]);

    var image_to_display = showImage();
    final circularProfileAvatar = CircularProfileAvatar(
      '',
      child: image_to_display,
      animateFromOldImageOnUrlChange: true,
      borderColor: Colors.blueGrey,
      borderWidth: 2,
      elevation: 3,
      radius: 60,
      onTap: () {
        getImageGallery();
        image_to_display = showImage();
      },
    );

    String validatePseudo(String value) {
      // TODO Check si le pseudo existe déjà dans la BD (fonction à mettre dans un autre fichier)
      return null;
    }

    final pseudo = new TextFormField(
      controller: pseudoController,
      keyboardType: TextInputType.text,
      autofocus: false,
      autovalidate: _PseudoValidator,
      validator: validatePseudo,
      focusNode: focusNodePseudo,
      decoration: InputDecoration(
        labelText: 'Pseudo *',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final identity_widget = new Row(
      children: [
        Expanded(
          flex: 2,
          child: circularProfileAvatar,
        ),
        SizedBox(
          width: 60.0,
        ),
        Expanded(
          flex: 3,
          child: pseudo,
        ),
      ],
    );

    String validateEmail(String value) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(value))
        return 'Entrez un e-mail vailde.';
      else
        return null;
    }

    final mail = new TextFormField(
      controller: mailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      autovalidate: _EmailValidator,
      validator: validateEmail,
      focusNode: focusNodeEmail,
      decoration: InputDecoration(
        labelText: 'Mail*',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = new Row(
      children: [
        Expanded(
            flex: 3,
            child: TextField(
              controller: mdpController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              autofocus: false,
              decoration: InputDecoration(
                labelText: 'Mot de passe*',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ),
            )),
        Expanded(
            flex: 3,
            child: TextField(
              controller: confirmationmdpController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              autofocus: false,
              decoration: InputDecoration(
                labelText: 'Confirmation Mdp*',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ),
            )),
      ],
    );
    final date = new Row(children: [
      Expanded(
          flex: 4,
          child: TextField(
            controller: dateNaissanceController,
            keyboardType: TextInputType.datetime,
            autofocus: false,
            inputFormatters: [DateTextFormatter()],
            onChanged: (String value) {},
            decoration: InputDecoration(
              labelText: "Date de Naissance",
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
          )),
      Expanded(
        child: IconButton(
          icon: Icon(Icons.date_range),
          onPressed: () {
            showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1920),
                    lastDate: DateTime(2050))
                .then((date) {
              setState(() {
                _dateTime = date;
              });
            });
          },
        ),
      )
    ]);

    _buildExpansionTileInfoFacultative() {
      return ExpansionTile(
        initiallyExpanded: false,
        title: _buildTileTitle('Infos Facultatives'),
        children: <Widget>[
          SizedBox(height: 22),
          Row(
            children: [
              Expanded(
                  flex: 3,
                  child: TextField(
                    controller: nomController,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Nom',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: TextField(
                    controller: prenomController,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Prénom',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  )),
            ],
          ),
          SizedBox(height: 22),
          TextField(
            controller: zoneGeographiqueController,
            keyboardType: TextInputType.text,
            autofocus: false,
            decoration: InputDecoration(
              labelText: 'Zone Géographique',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
          ),
        ],
      );
    }

    List competenceListFunction() {
      List competenceList = List();
      competenceList.add(myCompetence_1);
      competenceList.add(myCompetence_2);
      competenceList.add(myCompetence_3);
      competenceList.add(myCompetence_4);
      competenceList.add(myCompetence_5);
      return competenceList;
    }

    refresh_competence(dynamic competenceList) {
      setState(() {
        selectedCompetences = competenceList;
      });
    }

    _buildExpansionTileCompetence() {
      return ExpansionTile(
        initiallyExpanded: false,
        title: _buildTileTitle('Compétences'),
        children: <Widget>[
          Container(
              color: Colors.amber,
              child: new MultiSelectWidget(
                notifyParent: refresh_competence,
                titleMultiSelect: 'Ajouter vos compétences',
                textFieldName: 'name',
                textFieldValue: 'value',
                objectList: competenceListFunction(),
                selectedvalues: selectedCompetences,
              )),
        ],
      );
    }

    List materielListFunction() {
      List materielList = List();
      materielList.add(myMateriel_1);
      materielList.add(myMateriel_2);
      materielList.add(myMateriel_3);
      materielList.add(myMateriel_4);
      materielList.add(myMateriel_5);
      return materielList;
    }

    refresh_material(dynamic materialList) {
      setState(() {
        selectedMaterials = materialList;
      });
    }

    _buildExpansionTileMateriel() {
      return ExpansionTile(
        initiallyExpanded: false,
        title: _buildTileTitle('Matériels'),
        children: <Widget>[
          Container(
              color: Colors.amber,
              child: new MultiSelectWidget(
                notifyParent: refresh_material,
                titleMultiSelect: 'Ajouter un matériel',
                textFieldName: 'name',
                textFieldValue: 'value',
                objectList: materielListFunction(),
                selectedvalues: selectedMaterials,
              )),
        ],
      );
    }

    final checkbox = new Container(
      padding: new EdgeInsets.all(32.0),
      child: new Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new CheckboxListTile(
                title:
                    Text.rich(new TextSpan(text: "J'accepte les ", children: [
                  new TextSpan(
                      text: 'CGU',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  elevation: 16,
                                  child: Container(
                                    height: 400.0,
                                    width: 360.0,
                                    padding:
                                        EdgeInsets.fromLTRB(16, 16, 16, 16),
                                    child: Text('Détails des CGU'),
                                  ),
                                );
                              });
                        }),
                  new TextSpan(text: '. *')
                ])),
                value: _valueCheckboxCGU,
                onChanged: (newValue) {
                  setState(() {
                    _valueCheckboxCGU = newValue;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              new CheckboxListTile(
                title: Text("Je souhaite recevoir les NewsLetter Idea"),
                value: _valueCheckboxNewsLetter,
                onChanged: (newValue) {
                  setState(() {
                    _valueCheckboxNewsLetter = newValue;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              )
            ],
          ),
        ],
      ),
    );

    Widget inscriptionButton = // PostItButton(text: 'text', onTapUp: () {});
        LongPostItButton(
      text: "Valider l'inscription",
      color: LPColors.blue,
      onTapUp: () {
        //FIXME : Pour l'instant envoie jsuter vers une page profil avec les infos entrées

        //Création d'un utilisateur avec les data que l'on a dans la page
        User nouvelUser = User(
          isAnonymous: false,
          infosOblig: InformationsObligatoiresUser(
            pseudo: pseudoController.text == null
                ? ''
                : pseudoController.text.toString(),
            email: mailController.text == null
                ? ''
                : mailController.text.toString(),
            password:
                mdpController.text == null ? '' : mdpController.text.toString(),
            /* dateNaissance: ((dateNaissanceController.text == null) | (dateNaissanceController.text.isEmpty))
                  ? DateTime.now()
                  : DateParser.parseStringToDateTime(
                      dateNaissanceController.text.toString(),
                    ),*/
          ),
          infosFacultatives: InformationsFacultativesUser(
            nom:
                nomController.text == null ? '' : nomController.text.toString(),
            prenom: prenomController.text == null
                ? ''
                : prenomController.text.toString(),
            zoneGeographique: zoneGeographiqueController.text == null
                ? ''
                : zoneGeographiqueController.text.toString(),
            checkboxNewsLetter: _valueCheckboxNewsLetter,
          ),
          //FIXME : ON envoie les infos comme ça, il faudrait envoyer l'image
          profileInfos: ProfileInformation(
            title: DefaultTitle('Idéateur novice'),
            level: Level(43),
          ),
        );

        print('Nouvel user :\r\n' + nouvelUser.toString());

        Navigator.of(context).pushNamed('/userProfile', arguments: nouvelUser);
      },
    );

    return Container(
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
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 10),
            identity_widget,
            SizedBox(height: 22),
            separator,
            SizedBox(height: 5),
            mail,
            SizedBox(height: 22),
            password,
            SizedBox(height: 22),
            //date,
            //SizedBox(height: 5),
            _buildExpansionTileInfoFacultative(),
            SizedBox(height: 5),
            _buildExpansionTileCompetence(),
            SizedBox(height: 5),
            _buildExpansionTileMateriel(),
            SizedBox(height: 22),
            checkbox,
            SizedBox(height: 22),
            Center(child: inscriptionButton),
          ],
        ),
      ),
    );
  }
}

class DateTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    //this fixes backspace bug
    if (oldValue.text.length >= newValue.text.length) {
      return newValue;
    }

    var dateText = _addSeperators(newValue.text, '/');
    return newValue.copyWith(
        text: dateText, selection: updateCursorPosition(dateText));
  }

  String _addSeperators(String value, String seperator) {
    value = value.replaceAll('/', '');
    var newString = '';
    for (int i = 0; i < value.length; i++) {
      newString += value[i];
      if (i == 1) {
        newString += seperator;
      }
      if (i == 3) {
        newString += seperator;
      }
    }
    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
