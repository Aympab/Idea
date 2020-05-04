import 'dart:io';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/user.dart';
import 'package:idea/view/profile/profileMain.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({@required this.displayedUser});

  final User displayedUser;

  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
        centerTitle: true,
        title: Text(widget.displayedUser.infosOblig.pseudo),
        background: _buildMainBackground());
  }

  Widget _buildMainBackground() {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 10,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: _buildPictureTopLeft(),
                  ),
                  Expanded(
                    child: _buildInfosTopRight(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: Center(
                child: Text("data"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPictureTopLeft() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0.0),
        child: CircleAvatar(
          backgroundImage: getImage(widget.displayedUser),
          radius: 70.0,
        ),
      ),
    );
  }

  Widget _buildInfosTopRight() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Expanded(
          child: widget.displayedUser.profileInfos.title.toPrettyText()
        ),
        Expanded(
          child: Text(
            widget.displayedUser.profileInfos.level.toString(),
            style: widget.displayedUser.profileInfos.level.style,
          ),
        )
      ],
    );
  }
}

//TODO : Umplement getImage, should returns the profile pic of a given user
ImageProvider getImage(User user) {
  return NetworkImage('https://mgl.skyrock.net/big.138267340.jpg?77868592');
}
