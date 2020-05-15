import 'package:flutter/material.dart';
import 'package:idea/model/user.dart';

class InheritedFlux extends InheritedWidget {
  InheritedFlux({Key key, @required this.authUser}) : super(key: key, child: FluxMainView());

  final User authUser; 

  static InheritedFlux of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<InheritedFlux>();

  @override
  bool updateShouldNotify( InheritedFlux oldWidget) {
    return false;
  }
}

class FluxMainView extends StatefulWidget {
  FluxMainView({Key key}) : super(key: key);

  @override
  _FluxMainViewState createState() => _FluxMainViewState();
}

class _FluxMainViewState extends State<FluxMainView> {
  @override
  Widget build(BuildContext context) {
    User authUser = InheritedFlux.of(context).authUser;
    
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
          child: authUser.isAnonymous ? Text('Flux Anonyme de ${authUser.uid}') :Text('Flux de ${authUser.pseudo}') ,
        ),
      ),
    );
  }
}
