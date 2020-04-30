class User{

  String pseudo;
  String email;
  String password;
  DateTime dateNaissance;

  InformationsFacultativesUser infosFacultatives;

  User({this.pseudo, this.email, this.password, this.dateNaissance});
  
}
  
class InformationsFacultativesUser {
  String prenom;
  String nom;
  String zoneGeographique;
}