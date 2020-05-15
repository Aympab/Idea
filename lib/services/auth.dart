import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on FirebaseUser
  User _anonymUserFromFirebaseUser(FirebaseUser fbUser) {
    return fbUser != null ? User(isAnonymous: true,uid:fbUser.uid) : null;
  }

  //stream changes whenever user logs in or out
  Stream<User> get user {
    return _auth.onAuthStateChanged
      //.map((FirebaseUser user) => _anonymUserFromFirebaseUser(user));
    .map(_anonymUserFromFirebaseUser); //Identique à la ligne au dessus
  }


  //sign-in anonymously
  Future signInAnonym() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _anonymUserFromFirebaseUser(user);
    } catch (e) {
      //TODO : implement page on nul return
      print(e.toString());
      return null;
    }
  }

  //sign-in with mail/passwd

  //register with mail/passwd

  //sign-out
}
