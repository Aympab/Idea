import 'package:flutter/material.dart';

enum ThemeType { Light, Dark }

class ThemeModel extends ChangeNotifier {
  ThemeData currentTheme = darkTheme;
  ThemeType themeType = ThemeType.Dark;

  toggleTheme() {
    if (themeType == ThemeType.Dark) {
      currentTheme = lightTheme;
      themeType = ThemeType.Light;
      return notifyListeners();
    }

    if (themeType == ThemeType.Light) {
      currentTheme = darkTheme;
      themeType = ThemeType.Dark;
      return notifyListeners();
    }
  }
}


ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: Color(0xff1f655d),
  accentColor: Color(0xff40bf7a),
  textTheme: TextTheme(
      title: TextStyle(color: Color(0xff40bf7a)),
      subtitle: TextStyle(color: Colors.white),
      subhead: TextStyle(color: Color(0xff40bf7a))),
  appBarTheme: AppBarTheme(color: Color(0xff1f655d)),
);

ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Color(0xfff5f5f5),
    accentColor: Color(0xff40bf7a),
    textTheme: TextTheme(
        title: TextStyle(color: Colors.black54),
        subtitle: TextStyle(color: Colors.grey),
        subhead: TextStyle(color: Colors.white)),
    appBarTheme: AppBarTheme(
        color: Color(0xff1f655d),
        actionsIconTheme: IconThemeData(color: Colors.white)));


//TODO : Design themes
TabBarTheme tabBarTheme = TabBarTheme(
  labelColor: Colors.blue[600],
  unselectedLabelColor: Colors.blue[900],
  indicator: UnderlineTabIndicator(
    borderSide: BorderSide(
      style: BorderStyle.solid,
      width: 5.0,
      color: Colors.blue[600],
    ),
  ),
);
