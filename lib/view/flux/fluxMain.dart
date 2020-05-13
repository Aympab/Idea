import 'package:flutter/material.dart';

class FluxMainView extends StatefulWidget {
  FluxMainView({Key key}) : super(key: key);

  @override
  _FluxMainViewState createState() => _FluxMainViewState();
}

class _FluxMainViewState extends State<FluxMainView> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
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
          child: Text('Flux'),
        ),
      ),
    );
  }
}
