import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/idea.dart';
import 'package:idea/model/user.dart';
import 'package:idea/services/auth.dart';
import 'package:idea/view/flux/ideaList.dart';
import 'package:idea/view/loadingScreen.dart';
import 'package:provider/provider.dart';
import 'package:idea/services/database.dart';
import 'package:provider/provider.dart';

class InheritedFlux extends InheritedWidget {
  InheritedFlux({Key key, this.currentUser}) : super(key: key, child: FluxMainView());

  final User currentUser;

  static InheritedFlux of(BuildContext context) {
    return  (context.dependOnInheritedWidgetOfExactType<InheritedFlux>());;
  }

  @override
  bool updateShouldNotify( InheritedFlux oldWidget) {
    return true;
  }
}

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
              FutureProvider<User>.value(value: DatabaseService().getUserFromUid(authUser.uid))
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
                      Text('Flux de ${authUser.uid}'),
                      Expanded(
                          // height: 200,
                          // width: 200,
                          child: IdeaList()),
                      SizedBox(height: 50),
                      RaisedButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/newIdeaPage'),
                        child: Text('Nouvelle idée'),
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
                ),
              ),
            ),
          );
  }
}
