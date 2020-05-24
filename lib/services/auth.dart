import 'package:firebase_auth/firebase_auth.dart';
import 'package:idea/model/user.dart';
import 'package:idea/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser fbUser) {
    return fbUser != null ? User(uid: fbUser.uid) : null;
  }

  // Future<User> _fullUserFromFb(FirebaseUser fbUser) async {
  //   User user = await DatabaseService().getUserFromUid(fbUser.uid);
  //   return fbUser != null ? User(uid: fbUser.uid) : null;
  // }

  //stream changes whenever user logs in or out
  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged.map((FirebaseUser user) => user);
    // .map(_userFromFirebaseUser); //Identique à la ligne au dessus
  }

  //sign-in anonymously
  Future signInAnonym() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign-in with mail/passwd
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      //TODO : Get the user corresponding to this uid from the Db
      return _userFromFirebaseUser(user);
    } catch (e) {}
  }

  //When registering a new user, calls the DBService
  Future registerUser(User user) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);

      FirebaseUser fbUser = result.user;

      User newUser = User(
        uid: fbUser.uid,
        infosOblig: user.infosOblig,
        infosFacultatives: user.infosFacultatives,
        isAnonymous: false,
      );

      //Creation de l'user dans la DB
      await DatabaseService().createUserData(newUser);
      return newUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign-out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
