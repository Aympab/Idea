import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/designs/userProfile.dart';
import 'package:idea/model/designs/userProfileRelated.dart';
import 'package:idea/model/idea.dart';
import 'package:idea/model/user.dart';

class TestMain {
  static final User user = new User(
    isAnonymous: false,
    infosOblig: new InformationsObligatoiresUser(
      pseudo: 'The Rock',
      dateNaissance: DateTime.now(),
      email: 'therock@solide.com',
      password: 'therockBG',
    ),
    profileInfos: ProfileInformation(
        title: DefaultTitle('Idéateur novice'),
        level: Level(43),
        profilePic: Image.network(
            'https://mgl.skyrock.net/big.138267340.jpg?77868592')),
  );

  static final Idea idea = Idea(
    creator: user,
    shortDescription: 'Une idée vraiment géniale',
    title: 'Idée géniale',
  );
}
