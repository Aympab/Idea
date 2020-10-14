import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:idea/view/newIdea/secondPossiblePages/widgetsSecondPage.dart';

class SignUpPage extends StatefulWidget {
  //TODO : Implement nice signUp page

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _formKey;
  GlobalKey _pictureKey = GlobalKey<PictureFieldState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FormField(
                builder: (field) => Container(
                  child: PictureField(
                    key: _pictureKey,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text("Informations obligatoires"),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Pseudo',
                    //TODO : Sortir le input decoration dans une autre classe pour le réutiliser
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      //TODO : Valiadator pour le pseudo on passe dans le if si c'est pas bon
                      return "Le pseudo n'est pas valide";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: TextFormField(
                  decoration: InputDecoration(hintText: "E-mail"),
                  validator: validateEmail,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text("Informations Facultatives"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: TextFormField(
                  decoration: InputDecoration(hintText: "Prénom"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: TextFormField(
                  decoration: InputDecoration(hintText: "Nom"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    // Retourne true si le formulaire est valide, sinon false
                    if (_formKey.currentState.validate()) {
                      // Affiche le Snackbar si le formulaire est valide
                      _scaffoldKey.currentState.showSnackBar(
                          SnackBar(content: Text('Traitement en cours')));
                    }
                  },
                  child: Text('Créer un compte'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Entrez un e-mail vailde.';
    else
      return null;
  }
}
