import 'package:flutter/material.dart';

enum ThemeType { Light, Dark }

class ThemeModel extends ChangeNotifier {
  ThemeData currentTheme = lightTheme;
  ThemeType themeType = ThemeType.Dark;

  LinearGradient globalGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Color(0xFFC114).withOpacity(1.0),
      Color(0xF8EABF).withOpacity(1.0),
    ],
  );

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
    textTheme: Typography.whiteMountainView,
    // appBarTheme: AppBarTheme(color: Color(0xff1f655d)),
    appBarTheme: AppBarTheme(color: Colors.blue));

ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.black,
  accentColor: Color(0xff40bf7a),
  textTheme: Typography.blackMountainView,
  // appBarTheme: AppBarTheme(color: Colors.amber[600])
  appBarTheme: AppBarTheme(
    color: Color(0xff1f655d),
    actionsIconTheme: IconThemeData(color: Colors.white),
  ),
);

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
