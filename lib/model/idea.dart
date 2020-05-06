import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'ideaCategory.dart';

class Idea extends Equatable {
  String title;
  Image mainPicture;
  String shortDescription;
  List<IdeaCategory> categories;

  @override
  // TODO: implement props
  List<Object> get props => null;
}
