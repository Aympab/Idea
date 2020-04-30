import 'package:flutter/cupertino.dart';

class User {
  String pseudo;
  String email;
  String password;
  DateTime dateNaissance;

  InformationsFacultativesUser infosFacultatives;

  User(
      {@required this.pseudo,
      @required this.email,
      @required this.password,
      this.dateNaissance,
      this.infosFacultatives});
}

class InformationsFacultativesUser {
  String prenom;
  String nom;
  String zoneGeographique;

  InformationsFacultativesUser({this.prenom, this.nom, this.zoneGeographique});
}
