import 'package:flutter/material.dart';
import 'package:idea/view/profile/profileMain.dart';

import 'launchingAppTest.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      title: 'Idea',
      home: InheritedProfile(
        user: TestMain.user,
        child: ProfileView(),
      ),
    );
  }
}


