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
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Expanded(
                  child: Image.asset('assets/loadingGIF.gif'),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Chargement...',
                        style: TextStyle(
                          fontFamily: "ComingSoon",
                          fontSize: 50,
                          color: Color(0xff000000),
                        ),
                      ),
                      Text(
                        'Veuillez patientez.',
                        style: Provider.of<ThemeModel>(context).globalTextStyle,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
