import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:idea/model/designs/userProfileRelated.dart';
import 'package:idea/model/idea.dart';
import 'package:idea/model/user.dart';

class DatabaseService {
  DatabaseService();

  //
  //USER SERVICES
  //
  //Reference to the DB collection
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  //Called on pageInscription, used to create a user record in the DB
  Future createUserData(User user) async {
    return await userCollection.document(user.uid).setData({
      'pseudo': user.pseudo,
      'niveau': Level(1).toString(),
      'titre': DefaultTitle('Nouvel idéateur').toString(),
      'prenom': user.infosFacultatives.prenom,
      'nom': user.infosFacultatives.nom,
      'zoneGeo': user.infosFacultatives.zoneGeographique,
    });
  }

  Future updateUserData(User user) async {
    return await userCollection.document(user.uid).setData({
      'pseudo': user.pseudo,
      'niveau': user.level,
      'titre': user.title,
      'prenom': user.infosFacultatives.prenom,
      'nom': user.infosFacultatives.nom,
      'zoneGeo': user.infosFacultatives.zoneGeographique,
    });
  }

  //Get Users
  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }

  //
  //IDEA SERVICES
  //
  final CollectionReference ideaCollection =
      Firestore.instance.collection('ideas');

  Future createIdeaData(Idea idea) async {
    return await ideaCollection.add({
      'title': idea.title,
      'shortDescription': idea.shortDescription,
      'creatorPseudo': idea.creator.pseudo,
      'supports': 0,
      'advancement': 0,
    });
  }

  Future addSupportToIdea(Idea idea) async {
    return await ideaCollection.document(idea.uid).setData({
      'supports': idea.addSupport(),
    });
  }

  //Get Ideas
  Stream<QuerySnapshot> get ideas {
    return ideaCollection.snapshots();
  }
}
