import 'package:flutter_test/flutter_test.dart';
import 'package:idea/model/besoins.dart';
import 'package:idea/model/user.dart';

//Classe pour tester du code et les test flutter
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

  test("ajout de besoins dans un user", () {
    //Given : un user sans besoin
    User user = User(
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

    //When : on lui ajoute trois besoins
    user.besoinsPossibles
        ..add(Competence.avecNbUtilis(nom: 'Dev Flutter', nombreUtilise: 2))
        ..add(Materiel(nom: 'Marteau'))
        ..add(Contact(nom: 'Ingé NASA'));

    //Then : la longueur de la liste des besoins doit être 3
    expect(3, user.besoinsPossibles.length);
  });

  
}
