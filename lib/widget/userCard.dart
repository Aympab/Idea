import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/user.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key key, this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: Card(child: Column(children: <Widget>[],),)
    // );
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width/1.55),
              child: Card(
                color: Color(0x5F71B3).withOpacity(1),
          child: InkWell(
            //TODO : Adapt with ThemeColor 
            splashColor: Colors.amber,
            onTap: () {
              //TODO Go to user profile
              print('Card tapped.');
            },
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
               SizedBox(height: 5,),
                ListTile(
                  leading: user.profileInfos.profilePic,
                  title: Text(user.pseudo),
                  subtitle: Text('${user.title}\nNiveau ${user.level}', style: TextStyle(color: Colors.grey),),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(width: 10,),
                    FlatButton(
                      child: Text('PROFIL'),
                      //TODO Go to user profile
                      onPressed: () {/* ... */},
                    ),
                    FlatButton(
                      child: Text('SUIVRE'),
                      //TODO Follow this user with actual user
                      onPressed: () {/* ... */},
                    ),
                    //TODO : Add more infos like how many idead he made for example
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
