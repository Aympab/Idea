import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader();
  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      centerTitle: true,
      title: Text("User 404"),
      background: Center(
        child: CircularProfileAvatar(
          "User404",
          child: Icon(Icons.accessibility_new),
        ),
      ),
    );
  }
}
