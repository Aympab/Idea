import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on FirebaseUser
  // User _anonymUserFromFirebaseUser(FirebaseUser fbUser) {
  //   return fbUser != null ? User(isAnonymous: true, uid: fbUser.uid) : null;
  // }
    User _userFromFirebaseUser(FirebaseUser fbUser) {
    return fbUser != null ? User(uid: fbUser.uid) : null;
  }


  //stream changes whenever user logs in or out
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _anonymUserFromFirebaseUser(user));
        .map(_userFromFirebaseUser); //Identique à la ligne au dessus
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
  Future signInWithEmailAndPassword(String email, String password) async{
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    
    } catch (e) {
    }
  }


  //register with mail/passwd
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
  }catch(e){
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
