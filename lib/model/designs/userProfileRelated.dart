import 'package:flutter/cupertino.dart';

class Level {}

abstract class UserTitle {
  final String title;
  final TextStyle style;

  UserTitle(this.title, this.style);
}

class DefaultTitle extends UserTitle{
  DefaultTitle(String titleString, TextStyle style) : super(titleString, style);

}