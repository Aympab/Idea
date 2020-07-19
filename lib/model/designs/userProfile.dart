import 'package:flutter/cupertino.dart';
import 'package:idea/model/designs/userProfileRelated.dart';

import '../idea.dart';

//This class is used in the profile view
class ProfileInformation {
  final Image profilePic;

  UserTitle title;
  Level level;

  List<Success> successes;
  List<Idea> inventions;
  List<Idea> ideasHelped;
  final Summary summary;

  ProfileInformation({
    this.profilePic,
    this.title,
    this.level,
    this.successes,
    this.inventions,
    this.ideasHelped,
    this.summary,
  });
}

class Success {
  final Image picture;
  final String name;
  final String description;

  Success(this.picture, this.name, this.description);
}

//User's summary of his or her skills
//Each value is an integer between 1 and 100
class Summary {
  int creativity;
  int sharing;
  int social;
  //TODO : Define on what skills is the summary based
}
