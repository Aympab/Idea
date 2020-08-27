import 'package:flutter/material.dart';
import 'package:idea/model/user.dart';
import 'package:provider/provider.dart';

class DrawerFlux extends StatelessWidget {
  const DrawerFlux({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          //TODO : Implement nice personalized header
          DrawerHeader(
            child: Center(
              child: Text('Bonjour, ${Provider.of<User>(context).pseudo} !'),
            ),
            decoration: BoxDecoration(
              color: Color(0xFFC114).withOpacity(1.0),
            ),
          ),
          ListTile(
            title: Text('Mon profil'),
            onTap: () {
              Navigator.of(context).pushNamed('/userProfile',
                  arguments: Provider.of<User>(context, listen: false));
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
