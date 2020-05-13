import 'package:flutter/material.dart';
import 'package:idea/tools/themes.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: Provider.of<ThemeModel>(context).globalGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Column(
              children: <Widget>[Image.asset('assets/images/loadingGIF.gif')],
            ),
          ),
        ),
      ),
    );
  }
}
