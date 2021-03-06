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

  Future addSupportedIdeaToUser(User user, String newIdeaUid) async {
    user.supportedIdeasUID.add(newIdeaUid);
    return await userCollection
        .document(user.uid)
        .updateData({'supportedIdeas': user.supportedIdeasUID});
  }

  //Returns a user from a uid
  Future<User> getUserFromUid(String uid) async {
    User user;
    bool anonym;
//On vérifier d'abord l'existence du document dans la BD
    await userCollection.document(uid).get().then((doc) {
      if (doc.exists) {
        anonym = false;
      } else {
        //Si l'user n'existe pas c'est un user anonyme
        anonym = true;
      }
    });

    anonym
        ? user = User(
            uid: uid,
            isAnonymous: true,
            //TODO : Generate anonymous pseudo
            infosOblig: InformationsObligatoiresUser(pseudo: 'Anonyme'))
        : await userCollection.document(uid).get(source: Source.server).then(
              (value) => user = User(
                isAnonymous: false,
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
                ),
                supportedIdeasUID:
                    _dynamicListToStringList(value.data['supportedIdeas']) ??
                        List<String>(),
              ),
            );

    return user;
  }

  ///

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
      'imageURL': idea.imageURL,
      'shortDescription': idea.shortDescription,
      'creatorPseudo': idea.creator.pseudo,
      'supports': idea.supports,
      'advancement': idea.advancement,
      'categories': idea.getCategoriesAsStrings(),
      'difficulty': idea.difficulty,
      'created': FieldValue.serverTimestamp(),
    });
  }

  Future addSupportToIdea(Idea idea, User user) async {
    //Adding the reference of the idea into the user's supported ideas
    if (!user.isAnonymous) {
      //get the current table of supported ideas
      List<String> currentSupportedIdeas = List<String>();

      await userCollection.document(user.uid).get(source: Source.server).then(
          (value) => currentSupportedIdeas =
              _dynamicListToStringList(value.data['supportedIdeas']));

      //When we have the curretnSupportedIdeas
      if (currentSupportedIdeas.length > 0) {
        //If the user already has ideas, we have to check if this one is not already here
        if (!_ideaExistsInList(idea, currentSupportedIdeas)) {
          //Si l'user a pas encore liké l'idée
          //On l'ajoute dans la BD chez l'user
          await addSupportedIdeaToUser(user, idea.uid);
        }
      } else {
        //Si il a liké 0 idée, on l'ajoute aussi
        await addSupportedIdeaToUser(user, idea.uid);
      }
    }

    //On fait +1 au support de l'idée dans tous les cas
    return await ideaCollection.document(idea.uid).updateData({
      'supports': idea.addSupport(),
    });
  }

  bool _ideaExistsInList(Idea idea, List<String> ideasUid) {
    bool flag = false;
    for (String currUid in ideasUid) {
      if (currUid == idea.uid) {
        flag = true;
        return flag;
      }
    }
    return flag;
  }

  //All ideas from snapshot
  List<Idea> _ideaListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return ideaFromFirestoreWithOnlyPseudo(doc.documentID, doc.data);
    }).toList();
  }

  //Loads only the pseudo of the creator to display the flux
  Idea ideaFromFirestoreWithOnlyPseudo(String uid, Map data) {
    return Idea(
      uid: uid,
      title: data['title'] ?? 'error',
      creator: User(
        infosOblig: InformationsObligatoiresUser(
          pseudo: data['creatorPseudo'] ?? 'error',
        ),
      ),
      advancement: data['advancement'] ?? 0,
      shortDescription: data['shortDescription'] ?? 'error',
      supports: data['supports'] ?? 'error',
      imageURL: data['imageURL'],
      categories: data['categories'] != null
          ? dynamicListToCategoryList(data['categories'])
          : List<IdeaCategory>(),
      difficulty: data['difficulty'],
    );
  }

  List<String> _dynamicListToStringList(List<dynamic> list) {
    List<String> strings = List<String>();

    for (dynamic item in list) {
      strings.add(item.toString());
    }

    return strings;
  }

  List<IdeaCategory> dynamicListToCategoryList(List<dynamic> list) {
    List<IdeaCategory> categories = List<IdeaCategory>();

    for (dynamic item in list) {
      categories.add(IdeaCategory(name: item));
    }

    return categories;
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

  //Creates a new category with accepted to false, because a user submitted it
  Future suggestCategory(IdeaCategory category) async {
    //TODO : Check existence !!! sinon on met la popularity a 1 d'un truc deja existant !! 
    /*Ici on est au moment ou l'user a suggérer une catégorie, donc on veut la mettre en BD avec accepted à false
      Et la popularity à 1, sauf que la on vérifie pas l'existence on écrase direct le document en le remplacant
    */
    return await categoryCollection.document(category.name).setData({
      'popularity': 1,
      'accepted': false,
      'submitedDate': FieldValue.serverTimestamp()
    });
  }

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
