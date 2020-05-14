import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign-in anonymously
  Future signInAnonym() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch(e){
      //TODO : implement page on nul return
      print(e.toString());
      return null;
    }
  }

  //sign-in with mail/passwd

  //register with mail/passwd

  //sign-out
}