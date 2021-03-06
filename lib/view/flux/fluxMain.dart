import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/idea.dart';
import 'package:idea/services/auth.dart';
import 'package:idea/view/flux/ideaList.dart';
import 'package:idea/view/loadingScreen.dart';
import 'package:provider/provider.dart';
import 'package:idea/services/database.dart';

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
    FirebaseUser authUser = Provider.of<FirebaseUser>(context);

    return authUser == null
        ? LoadingScreen()
        : MultiProvider(
            providers: [
              StreamProvider<List<Idea>>.value(value: DatabaseService().ideas),
              // FutureProvider<User>.value(
              //   value: DatabaseService().getUserFromUid(authUser.uid),
              // ),
            ],
            child: DecoratedBox(
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
                resizeToAvoidBottomPadding: false,
                backgroundColor: Colors.transparent,
                body: SafeArea(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Flux d'idées",
                        //'Flux de ${authUser.uid}',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontFamily: 'BalsamiqSans', fontSize: 35),
                      ),
                      Expanded(
                          // height: 200,
                          // width: 200,
                          child: IdeaList()),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () =>
                                Navigator.of(context).pushNamed('/newIdeaPage'),
                            child: Text('Nouvelle Idée'),
                          ),
                          FlatButton(
                            // autofocus: false,
                            child: Container(
                                color: Colors.amber, child: Text('Logout')),
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
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
