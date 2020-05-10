import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign-in anonymously
  Future signInAnonym() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
    } catch(e){

    }
  }

  //sign-in with mail/passwd

  //register with mail/passwd

  //sign-out
}