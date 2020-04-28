import 'package:equatable/equatable.dart';

abstract class Besoin extends Equatable {
  String nom;
  int nombreUtilise;

  Besoin({this.nom, this.nombreUtilise});

  void incrNombreUtilise() => this.nombreUtilise++;
}

class Competence extends Besoin{
  //FIXME : Ici ça va pas le constructeur
  Competence(nom, nombreUtilise) : super();

  @override
  List<Object> get props => [this.nom, this.nombreUtilise];
}

class Materiel extends Besoin{
  @override
  List<Object> get props => [this.nom, this.nombreUtilise];
}

class Contact extends Besoin{
  @override
  List<Object> get props => [this.nom, this.nombreUtilise];
}