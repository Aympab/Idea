import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/user.dart';

import 'ideaCategory.dart';

class Idea {
  final String uid;
  String title;
  File imageFile;
  String imageURL;
  String shortDescription;
  List<IdeaCategory> categories;
  User creator;
  int supports;
  int advancement;
  int difficulty;

  Idea({
    this.uid,
    this.title,
    this.creator,
    this.imageFile,
    this.imageURL,
    this.shortDescription,
    this.advancement,
    this.categories,
    this.supports,
    this.difficulty,
  });

  int addSupport() {
    this.supports++;
    return this.supports;
  }

  List<String> getCategoriesAsStrings() {
    List<String> categoriesAsString = List<String>();

    for (IdeaCategory category in categories) {
      categoriesAsString.add(category.name);
    }

    return categoriesAsString;
  }
}
