abstract class Besoin {
  String nom;
  int nombreUtilise;

  Besoin({this.nom, this.nombreUtilise});

  void incrNombreUtilise() => this.nombreUtilise++;
}

class Competence extends Besoin {
  Competence.avecNbUtilis({String nom, int nombreUtilise})
      : super(nom: nom, nombreUtilise: nombreUtilise);

  Competence({String nom}) : super(nom: nom, nombreUtilise: 0);
}

class Materiel extends Besoin {
  Materiel.avecNbUtilis(String nom, int nombreUtilise)
      : super(nom: nom, nombreUtilise: nombreUtilise);

  Materiel({String nom}) : super(nom: nom, nombreUtilise: 0);
}

class Contact extends Besoin {
  Contact.avecNbUtilis(String nom, int nombreUtilise)
      : super(nom: nom, nombreUtilise: nombreUtilise);

  Contact({String nom}) : super(nom: nom, nombreUtilise: 0);
}
