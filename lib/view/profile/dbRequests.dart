import 'dart:io';

import 'package:idea/model/user.dart';

//TODO : Implement getUserFromDB
//Il faut déterminer comment on décide d'appeler l'user (un ID ? une instance ? etc )
Future<User> getUserFromDB() async {
  User user = new User(
    infosOblig: InformationsObligatoiresUser(
      dateNaissance: DateTime.now(),
      email: "email",
      password: "pass",
      pseudo: "pseudo",
    ),
    infosFacultatives: InformationsFacultativesUser(
      nom: "nom",
      prenom: "prenom",
      zoneGeographique: "zone géographique",
    ),
  );

  sleep(Duration(seconds: 1));
  return user;
}
