import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idea/view/inscription.dart';
import 'package:idea/view/profile/profile.dart';

import 'view/inscription.dart';
import 'bloc/inscription/inscription_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Idea',
      home: BlocProvider(
            create: (BuildContext context) => InscriptionBloc(), 
            child: ProfileView()
          )
        );
  }
}