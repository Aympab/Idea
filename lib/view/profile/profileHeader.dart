import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/user.dart';
import 'package:idea/tools/themes.dart';
import 'package:provider/provider.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({@required this.displayedUser});

  final User displayedUser;

  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            //Different backgroundColor depending on what kind of theme
            colors: (Provider.of<ThemeModel>(context).themeType == ThemeType.Dark) ? [Colors.amberAccent, Colors.green[100]] : [Colors.red, Colors.green[100]] ,
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(widget.displayedUser.infosOblig.pseudo),
          background: _buildMainBackground(),
        ));
  }

  Widget _buildMainBackground() {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 10,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: _buildPictureTopLeft(),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: _buildInfosTopRight(),
                    ),
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
    return CircularProfileAvatar(
      widget.displayedUser.profileInfos.getProfilePicPath(),
      errorWidget: (context, url, error) => Container(
        child: Icon(Icons.error),
      ),
      placeHolder: (context, url) => Container(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(),
      ),
      radius: 90,
      backgroundColor: Colors.transparent,
      borderWidth: 2,
      borderColor: Colors.blueGrey,
      elevation: 1.0,
      onTap: () {
        //TODO Implement onTap
        print('onTap Profile pic');
      },
      cacheImage: true,
    );
  }

  Widget _buildInfosTopRight() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Expanded(child: widget.displayedUser.profileInfos.title.toPrettyText()),
        Expanded(
            child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Text(
              "Niveau",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            SizedBox(width: 15),
            widget.displayedUser.profileInfos.level.toPrettyText(),
          ],
        ))
      ],
    );
  }
}

//TODO : Implement getImage, should return the profile pic of a given user
ImageProvider getImage(User user) {
  return user.profileInfos.getProfilePicAsImageProvider();
}
