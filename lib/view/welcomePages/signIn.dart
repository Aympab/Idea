import 'package:flutter/material.dart';
import 'package:idea/model/user.dart';
import 'package:idea/services/auth.dart';
import 'package:idea/tools/themes.dart';
import 'package:idea/view/loadingScreen.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthService _auth = AuthService();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  bool loading = false;

  @override
  void dispose() {
    _formKey = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingScreen()
        : DecoratedBox(
            decoration: BoxDecoration(
              gradient: Provider.of<ThemeModel>(context).globalGradient,
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/mainLightBulbLogo.png'),
                        TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Entez votre e-mail' : null,
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                        ),
                        TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Entez votre mot de passe' : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        RaisedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });

                              dynamic user = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (user == null) {
                                setState(() {
                                  loading = false;
                                  error =
                                      'Impossible de se connecter avec ces identifiants.';
                                });
                              } else {
                                Provider.of<User>(context, listen: false).setInfosWithUid((user as User).uid);
                                Navigator.of(context).pushNamed('/flux');
                                // Navigator.of(context).pushNamed('/newIdeaPage');
                              }
                            }
                          },
                          color: Colors.amber,
                          child: Text('Se connecter'),
                        ),
                        SizedBox(height: 20),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
