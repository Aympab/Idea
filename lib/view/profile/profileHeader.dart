import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/user.dart';
import 'package:idea/view/profile/profileMain.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader();
  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    final User user = InheritedProfile.of(context).user;

    return FlexibleSpaceBar(
      centerTitle: true,
      title: Text(user.infosOblig.pseudo),
      background: Center(
        child: CircularProfileAvatar(
          "bolosse",
          child: Icon(Icons.accessibility_new),
        ),
      ),
    );
  }
}
