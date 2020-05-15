import 'package:flutter/material.dart';
import 'package:idea/model/user.dart';
import 'package:idea/services/auth.dart';
import 'package:idea/view/loadingScreen.dart';
import 'package:provider/provider.dart';

class FluxMainView extends StatefulWidget {
  FluxMainView({Key key}) : super(key: key);

  @override
  _FluxMainViewState createState() => _FluxMainViewState();
}

class _FluxMainViewState extends State<FluxMainView> {
  AuthService _auth = AuthService();
  // bool loading = false;

  @override
  Widget build(BuildContext context) {
    User authUser = Provider.of<User>(context);

    return authUser == null ? LoadingScreen() : DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xFFC114).withOpacity(1.0),
                  Color(0xF8EABF).withOpacity(1.0),
                ],
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: Column(
                  children: <Widget>[
                    Text('Flux de ${authUser.uid}'),
                    FlatButton(
                      // autofocus: false,
                      child:
                          Container(color: Colors.amber, child: Text('Logout')),
                      onPressed: () async {
                        // setState(() {
                        //   loading = false;
                        // });
                        await _auth.signOut();
                        Navigator.of(context).pushReplacementNamed('/');
                      },
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
