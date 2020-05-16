import 'package:flutter/cupertino.dart';
import 'package:idea/model/user.dart';

import 'ideaCategory.dart';

class Idea {
  final String uid;
  String title;
  Image mainPicture;
  String shortDescription;
  List<IdeaCategory> categories;
  User creator;
  int supports;
  int advancement;

  Idea({
    this.uid,
    this.title,
    this.creator,
    this.mainPicture,
    this.shortDescription,
    this.advancement,
    this.categories,
    this.supports,
  });

  int addSupport() {
    this.supports++;
    return this.supports;
  }
}
