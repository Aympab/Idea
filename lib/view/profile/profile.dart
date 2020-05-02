import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/view/profile/profileHeader.dart';
import 'package:idea/view/profile/profileTabs.dart';

class ProfileView extends StatefulWidget {
  @override
  ProfileViewState createState() => ProfileViewState();
}

class ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber[100],
        body: Column(
          children: <Widget>[
            ProfileHeader(),
            ProfileTabs(),
          ],
        ),
      ),
    );
  }
}
