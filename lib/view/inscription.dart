import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idea/bloc/inscription/inscription_bloc.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';
import 'package:image_picker/image_picker.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'dart:io';
import 'dart:async';

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
  List selectedMateriels = [];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Inscription",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Image.asset('assets/logo.png'),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        //Ici on détermine quel méthode de build on va appeler en fonctoin du state
        child: BlocListener<InscriptionBloc, InscriptionState>(
          //Le listener permet d'ajouter des élements graphiques (on doit wrap with new widget le BlocCuilder)
          //Le listener return void
          //Le builder construit L'UI et est lancé plusieurs fois alros que le listener ne se lance qu'une fois pas changement d'état
          listener: (context, state) {},
          child: BlocBuilder<InscriptionBloc, InscriptionState>(
            builder: (BuildContext context, InscriptionState state) {
              if (state is InscriptionInitial) {
                return buildInitialInput();
              }
            },
          ),
        ),
      ),
    );
  }

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
      // TODO
	  // Check si le pseudo existe déjà 
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
      Pattern pattern =r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(value))
        return 'Enter Valid Email';
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
        labelText: 'Mail *',
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
                labelText: 'Mot de passe *',
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
                labelText: 'Confirmation Mdp *',
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

    final infosFacultatives = new ConfigurableExpansionTile(
      headerExpanded: Flexible(
        child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.title,
            children: [
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Icon(Icons.keyboard_arrow_down),
                ),
              ),
              TextSpan(
                text: 'Infos Facultatives',
              ),
            ],
          ),
        ),
      ),
      header: Container(
        child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.title,
            children: [
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Icon(Icons.keyboard_arrow_right),
                ),
              ),
              TextSpan(
                text: 'Infos Facultatives',
              ),
            ],
          ),
        ),
      ),
      children: [
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
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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

    final competences = new ConfigurableExpansionTile(
      headerExpanded: Flexible(
        child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.title,
            children: [
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Icon(Icons.keyboard_arrow_down),
                ),
              ),
              TextSpan(
                  text: 'Compétences', style: TextStyle(color: Colors.blue)),
            ],
          ),
        ),
      ),
      header: Container(
        child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.title,
            children: [
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Icon(Icons.keyboard_arrow_right),
                ),
              ),
              TextSpan(
                  text: 'Compétences', style: TextStyle(color: Colors.blue)),
            ],
          ),
        ),
      ),
      children: [
        MultiSelect(
          autovalidate: false,
          titleText: "Ajouter vos compétences",
          validator: (value) {
            if (value == null) {
              return 'Please select one or more option(s)';
            }
          },
          errorText: 'Please select one or more option(s)',
          dataSource: [
            {
              "name": "Bricolage",
              "value": 1,
            },
            {
              "name": "Jardinage",
              "value": 2,
            },
            {
              "name": "Développeur",
              "value": 3,
            },
            {
              "name": "Mécano",
              "value": 4,
            },
          ],
          textField: 'name',
          valueField: 'value',
          filterable: true,
          required: true,
          value: null,
          change: (values) {
            selectedCompetences = values;
          },
        ),
        // + more params, see example !!
      ],
    );

    final materiel = new ConfigurableExpansionTile(
      headerExpanded: Flexible(
        child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.title,
            children: [
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Icon(Icons.keyboard_arrow_down),
                ),
              ),
              TextSpan(
                  text: 'Matériel', style: TextStyle(color: Colors.purple)),
            ],
          ),
        ),
      ),
      header: Container(
        child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.title,
            children: [
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Icon(Icons.keyboard_arrow_right),
                ),
              ),
              TextSpan(
                  text: 'Matériel', style: TextStyle(color: Colors.purple)),
            ],
          ),
        ),
      ),
      children: [
        MultiSelect(
          autovalidate: false,
          titleText: "Ajouter un matériel",
          validator: (value) {
            if (value == null) {
              return 'Please select one or more option(s)';
            }
          },
          errorText: 'Please select one or more option(s)',
          dataSource: [
            {
              "name": "Marteau",
              "value": 1,
            },
            {
              "name": "Tondeuse",
              "value": 2,
            },
            {
              "name": "Tourne-vis",
              "value": 3,
            },
            {
              "name": "Scie",
              "value": 4,
            },
          ],
          textField: 'name',
          valueField: 'value',
          filterable: true,
          required: true,
          value: null,
          change: (values) {
            selectedMateriels = values;
          },
        ),
      ],
    );

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

    final validationInscription = FlatButton(
        onPressed: () {
          print(pseudoController.text.toString());
          print(mailController.text.toString());
          print(mdpController.text.toString());
          print(confirmationmdpController.text.toString());
          print(nomController.text.toString());
          print(prenomController.text.toString());
          print(zoneGeographiqueController.text.toString());
          print(dateNaissanceController.text.toString());
          print(selectedCompetences);
          print(selectedMateriels);
          print("CGU : ");
          print(_valueCheckboxCGU);
          print("NewsLetter : ");
          print(_valueCheckboxNewsLetter);
        },
        padding: EdgeInsets.all(0.0),
        child: Image.asset('assets/confirmInscriptionButton.png'));

    return SafeArea(
      child: ListView(
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          identity_widget,
          SizedBox(height: 22),
          separator,
          SizedBox(height: 5),
          mail,
          SizedBox(height: 22),
          password,
          SizedBox(height: 22),
          date,
          separator,
          SizedBox(height: 5),
          infosFacultatives,
          SizedBox(height: 5),
          separator,
          SizedBox(height: 5),
          competences,
          separator,
          SizedBox(height: 5),
          materiel,
          SizedBox(height: 22),
          checkbox,
          SizedBox(height: 22),
          validationInscription,
        ],
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
