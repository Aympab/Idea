import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:idea/model/user.dart';
import 'package:idea/routeGenerator.dart';
import 'package:idea/services/auth.dart';
import 'package:idea/tools/themes.dart';
import 'package:provider/provider.dart';

void main() { 
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (BuildContext context) => ThemeModel()),
          StreamProvider<FirebaseUser>.value(value: AuthService().user)
        ],
        child: MyApp(),
      ),
    );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeModel>(context).currentTheme,
      title: 'Idea',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      // home: LoadingScreen(),
    );
  }
}
