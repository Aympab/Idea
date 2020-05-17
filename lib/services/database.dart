import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:idea/model/designs/userProfile.dart';
import 'package:idea/model/designs/userProfileRelated.dart';
import 'package:idea/model/idea.dart';
import 'package:idea/model/ideaCategory.dart';
import 'package:idea/model/user.dart';

class DatabaseService {
  DatabaseService();

  ///
  ///
  ///
  //USER SERVICES
  ///
  ///
  //Reference to the DB collection
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  //Called on pageInscription, used to create a user record in the DB
  Future createUserData(User user) async {
    // print('DBSERVICE : USer id $uid');
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

  //Returns a user from a uid
  Future<User> getUserFromUid(String uid) async {
    User user;
    await userCollection.document(uid).get(source: Source.server).then(
          (value) => user = User(
              uid: uid,
              infosOblig: InformationsObligatoiresUser(
                pseudo: value.data['pseudo'],
              ),
              infosFacultatives: InformationsFacultativesUser(
                nom: value.data['nom'],
                prenom: value.data['prenom'],
                zoneGeographique: value.data['zoneGeo'],
              ),
              profileInfos: ProfileInformation(
                level: Level(
                  int.parse(value.data['niveau']),
                ),
                title: DefaultTitle(value.data['titre']),
              )),
        );

    return user;
  }

  ///
  ///
  ///
  //IDEA SERVICES
  ///
  ///
  ///
  final CollectionReference ideaCollection =
      Firestore.instance.collection('ideas');

  Future createIdeaData(Idea idea) async {
    return await ideaCollection.add({
      'title': idea.title,
      'shortDescription': idea.shortDescription,
      'creatorPseudo': idea.creator.pseudo,
      'supports': idea.supports,
      'advancement': idea.advancement,
    });
  }

  Future addSupportToIdea(Idea idea) async {
    return await ideaCollection.document(idea.uid).setData({
      'supports': idea.addSupport(),
    });
  }

//All ideas from snapshot
  List<Idea> _ideaListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {
      return ideaFromFirestoreWithOnlyPseudo(doc.data);
    }).toList();
  }
  //Loads only the pseudo of the creator to display the flux
  Idea ideaFromFirestoreWithOnlyPseudo(Map data) {
    return Idea(
      title: data['title'] ?? 'error',
      creator: User(
        infosOblig: InformationsObligatoiresUser(
          pseudo: data['creatorPseudo'] ?? 'error',
        ),
      ),
      advancement: data['advancement'] ?? 0,
      shortDescription: data['shortDescription'] ?? 'error',
      supports: data['supports'] ?? 'error',
    );
  }

  //Get Ideas
  Stream<List<Idea>> get ideas {
    return ideaCollection.snapshots().map(_ideaListFromSnapshot);
  }

  ///
  ///
  ///
  ///CATEGORY SERVICES
  ///
  ///
  ///
  final CollectionReference categoryCollection =
      Firestore.instance.collection('categories');

  Future<List<IdeaCategory>> getAllCategories() async {
    List<IdeaCategory> categories = List<IdeaCategory>();

    QuerySnapshot querySnapshot =
        await Firestore.instance.collection('categories').getDocuments();
    var list = querySnapshot.documents;

    for (DocumentSnapshot doc in list) {
      categories.add(
        IdeaCategory(
          name: doc.documentID,
          popularity: doc.data['popularity'],
        ),
      );
    }

    return categories;
  }

  Stream<QuerySnapshot> get categories {
    return categoryCollection.snapshots();
  }
}
