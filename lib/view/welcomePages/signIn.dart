import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(),
              TextField(),
              FlatButton(
                onPressed: () {},
                child: Text('Button'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
