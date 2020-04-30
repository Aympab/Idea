import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idea/model/user.dart';

void main() {
  test("test du ovveride de == sur deux utilisateurs", () {
    //Given : Deux utilisateurs identiques
    User user1 = User(
      infosOblig: InformationsObligatoiresUser(
          pseudo: 'pseudo',
          dateNaissance: DateTime(1998),
          email: 'email',
          password: 'password'),
      infosFacultatives: InformationsFacultativesUser(
        nom: 'nom',
        prenom: 'prenom',
        zoneGeographique: 'zone',
      ),
    );

    User user2 = User(
      infosOblig: InformationsObligatoiresUser(
          pseudo: 'pseudo',
          dateNaissance: DateTime(1998),
          email: 'email',
          password: 'password'),
      infosFacultatives: InformationsFacultativesUser(
        nom: 'nom',
        prenom: 'prenom',
        zoneGeographique: 'zone',
      ),
    );


    //When on test l'opérateur ==
    bool reponse = user1 == user2 ? true : false;

    //Then la réponse devrait être true
    expect(true, reponse);
  });

  test("creation de besoins", () {});

  test("ajout de besoins chez un user", () {});

  test("", () {});
}
