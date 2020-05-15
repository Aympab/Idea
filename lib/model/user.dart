import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:idea/model/besoins.dart';

import 'designs/userProfile.dart';

abstract class GlobalUser {
  final String uid;

  GlobalUser({this.uid});
}

class AnonymousUser extends GlobalUser {
  AnonymousUser({String uid}) : super(uid: uid);
}

class User extends GlobalUser {
  final InformationsObligatoiresUser infosOblig;
  final InformationsFacultativesUser infosFacultatives;

  //Il s'agit de la liste des Besoin que l'utilsateur est capable de combler
  //Sera surement à découper dans plusieurs Listes quand nécessaire
  List<Besoin> besoinsPossibles = List<Besoin>();

  final ProfileInformation profileInfos;

  User({String uid, this.infosOblig, this.infosFacultatives, this.profileInfos})
      : super(uid: uid);

  //Override de l'opérateur ==, on va vérifier s'ils ont soit la même référence, soit tous les attributs sont identiques SANS REGARDER LA LIST BESOIN !!
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          infosFacultatives == other.infosFacultatives &&
          infosOblig == other.infosOblig;

  int get hashCode => hashValues(infosOblig, infosFacultatives);
  //int get hashCode => hash2(infosOblig.hashCode, infosFacultatives.hashCode);

  @override
  String toString() {
    return 'Pseudo : ${infosOblig.pseudo}\r\nMail : ${infosOblig.email}\r\nPassword : ${infosOblig.password}\r\nNaissance : ${infosOblig.dateNaissance}\r\nPrenom : ${infosFacultatives.prenom}\r\nNom : ${infosFacultatives.nom}\r\nZone : ${infosFacultatives.zoneGeographique}';
  }

  //Pour retourner des infos basiques rapidement
  String get pseudo => infosOblig.pseudo;
  String get title => profileInfos.title.title;
  String get level => profileInfos.level.toString();
}

class InformationsObligatoiresUser extends Equatable {
  final String pseudo;
  final String email;
  final String password;
  final DateTime dateNaissance;

  InformationsObligatoiresUser(
      {this.pseudo, this.email, this.password, this.dateNaissance});

  @override
  List<Object> get props =>
      [this.pseudo, this.email, this.password, this.dateNaissance];
}

class InformationsFacultativesUser extends Equatable {
  final String prenom;
  final String nom;
  final String zoneGeographique;

  InformationsFacultativesUser({this.prenom, this.nom, this.zoneGeographique});

  @override
  List<Object> get props => [this.prenom, this.nom, this.zoneGeographique];
}
