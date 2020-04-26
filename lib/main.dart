import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idea/view/connexion.dart';
import 'bloc/connexion/connexion_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Idea',
      home: BlocProvider(
            create: (BuildContext context) => ConnexionBloc(), 
            child: ConnexionView()
          )
        );
  }
}
